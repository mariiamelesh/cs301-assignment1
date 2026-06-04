with user_amount_by_organization as (
	select org_id, count(user_id) as user_count 
	from activity.users 
	group by org_id
	having count(user_id) > 10
), big_organizations as (
	select organizations.org_id, industry, country
	from activity.organizations
	where organizations.org_id in (select org_id from user_amount_by_organization)
), failed_logins as (
	select users.user_id, big_organizations.industry, role, count(login_logs) as failed_login_count
	from activity.login_logs
	inner join activity.users on login_logs.user_id = users.user_id
	inner join big_organizations on users.org_id = big_organizations.org_id
	where login_logs.status = 'Failed'
	group by users.user_id, big_organizations.industry
), system_failures as (
	(select big_organizations.org_id, big_organizations.industry, systems.os_type, count(incident_id) as incident_count
	from activity.security_incidents
	inner join big_organizations on security_incidents.org_id = big_organizations.org_id
	inner join activity.systems on big_organizations.org_id = systems.org_id
	where severity = 'Critical'
	group by big_organizations.org_id, big_organizations.industry, systems.os_type)
	union all
	(select big_organizations.org_id, big_organizations.industry, systems.os_type, count(event_id) as incident_count
	from activity.network_events
	inner join activity.systems on network_events.system_id = systems.system_id
	inner join big_organizations on systems.org_id = big_organizations.org_id
	where severity = 'Critical'
	group by big_organizations.org_id, big_organizations.industry, systems.os_type)
)
select user_id, industry, role as error_source, failed_login_count as failure_count, 
case when user_id like 'U%' then 'user failure'
when user_id like 'ORG%' then 'system failure'
end failure_type
from ((select *
from failed_logins)
union all
(select *
from system_failures)
order by failed_login_count desc)
limit 50
