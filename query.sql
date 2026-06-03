with user_amount_by_organization as (
	select org_id, count(user_id) as user_count 
	from activity.users 
	group by org_id
	having count(user_id) > 1
), big_organizations as (
	select organizations.org_id, industry, country
	from activity.organizations
	where organizations.org_id in (select org_id from user_amount_by_organization)
), failed_logins as (
	select users.user_id, role, organizations.industry, count(login_logs) as failed_login_count
	from activity.login_logs
	inner join activity.users on login_logs.user_id = users.user_id
	inner join activity.organizations on users.org_id = organizations.org_id
	where login_logs.status = 'Success'
	group by users.user_id, organizations.industry
)
select *
from failed_logins
order by failed_logins.failed_login_count desc
