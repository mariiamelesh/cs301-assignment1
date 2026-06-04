# Practice Lab 1
## Dataset description
Dataset sourced from: https://www.kaggle.com/datasets/nudratabbas/sql-practice-dataset-3-hard-queries  
Dataset used for querying consists of 7 tables and shows data from a security system logger. It contains information on users('users' table), organizations users belong to('organizations' table), systems users use('systems' table) and login attempts from users('login_logs' table). Additionally, there is an event log, where events are ranked by severity('network_events' table); a security incident log with incident type and severity rank ('security_incident' table).
## Query description
Purpose of the query is to locate the weak points of the system by pointing out the users and organizations with more than 10 users where failed logins/system incidents happen the most. Returns a pivoted table limited to 50 rows(to demonstrate main threats only). Table contains the ID of organization/user, industry of organization, error source(either OS of the system or role of the user), and the amount of failures. Basically, it shows all the nesessary information for efficient location and resolution of the possible threat points in the system. Also, data returned by query could be used for providing statistics on the frequency of errors by industry, user role or systems' OS.
## Initialization instruction
For quick start, run the `init_db.sql` file from PostgreSQL connection. It will create a schema, create tables and insert the data into tables. After initialization, query can be executed from `query.sql` file.
