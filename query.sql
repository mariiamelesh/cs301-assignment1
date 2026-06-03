with user_amount_by_organization as (
	select org_id, count(user_id) as user_count 
	from activity.users 
	group by org_id
	having count(user_id) > 1
), big_organizations as (
	select organizations.org_id, industry, country
	from activity.organizations
	where organizations.org_id in (select org_id from user_amount_by_organization)
)

select *
from big_organizations

