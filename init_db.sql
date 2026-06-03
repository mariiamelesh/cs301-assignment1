
create schema if not exists activity;
create table activity.organizations (
	org_id varchar(50) PRIMARY KEY,
	industry varchar(50) NULL,
	country varchar(50) NULL
);

create table activity.users (
	user_id varchar(50) PRIMARY KEY,
	org_id varchar(50) NULL,
	"role" varchar(50) NULL
);

create table activity.systems (
	system_id varchar(50) PRIMARY KEY,
	org_id varchar(50) NULL,
	os_type varchar(50) NULL,
	criticality varchar(50) NULL
);

create table activity.security_incidents (
	incident_id varchar(50) PRIMARY KEY,
	org_id varchar(50) NULL,
	incident_type varchar(50) NULL,
	discovered_date varchar(50) NULL,
	severity varchar(50) NULL
);

create table activity.login_logs (
	login_id varchar(50) PRIMARY KEY,
	user_id varchar(50) NULL,
	login_time varchar(50) NULL,
	ip_address varchar(50) NULL,
	status varchar(50) NULL
);

create table activity.network_events (
	event_id varchar(50) PRIMARY KEY,
	system_id varchar(50) NULL,
	event_type varchar(50) NULL,
	"timestamp" varchar(50) NULL,
	severity varchar(50) NULL
);

create table activity.incident_systems (
	incident_id varchar(50) NULL,
	system_id varchar(50) NULL
);

insert into activity.organizations (org_id,industry,country) VALUES
	 ('ORG001','Finance','USA'),
	 ('ORG002','Tech','UK'),
	 ('ORG003','Healthcare','UK'),
	 ('ORG004','Finance','USA'),
	 ('ORG005','Retail','USA'),
	 ('ORG006','Finance','USA'),
	 ('ORG007','Healthcare','UK'),
	 ('ORG008','Finance','UK'),
	 ('ORG009','Retail','UK'),
	 ('ORG010','Retail','Germany'),
	 ('ORG011','Finance','UK'),
	 ('ORG012','Retail','Germany'),
	 ('ORG013','Tech','UK'),
	 ('ORG014','Healthcare','Germany'),
	 ('ORG015','Finance','USA'),
	 ('ORG016','Retail','USA'),
	 ('ORG017','Tech','Germany'),
	 ('ORG018','Tech','USA'),
	 ('ORG019','Retail','USA'),
	 ('ORG020','Retail','USA');

insert into activity.users (user_id,org_id,"role") VALUES
	 ('U0183','ORG001','Employee'),
	 ('U0834','ORG002','Analyst'),
	 ('U0116','ORG003','Employee'),
	 ('U0638','ORG004','Admin'),
	 ('U1074','ORG005','Analyst'),
	 ('U0395','ORG006','Admin'),
	 ('U0119','ORG007','Admin'),
	 ('U0739','ORG008','Admin'),
	 ('U0951','ORG009','Employee'),
	 ('U0063','ORG010','Analyst'),
	 ('U0914','ORG011','Employee'),
	 ('U1130','ORG012','Admin'),
	 ('U0530','ORG013','Employee'),
	 ('U0057','ORG014','Employee'),
	 ('U1172','ORG015','Admin'),
	 ('U0454','ORG016','Admin'),
	 ('U1335','ORG017','Analyst'),
	 ('U1398','ORG018','Admin'),
	 ('U0355','ORG019','Admin'),
	 ('U0517','ORG020','Admin');

insert into activity.systems (system_id,org_id,os_type,criticality) VALUES
	 ('S0016','ORG001','Mac','Low'),
	 ('S0314','ORG002','Linux','Medium'),
	 ('S0190','ORG003','Mac','High'),
	 ('S0497','ORG004','Windows','Medium'),
	 ('S0520','ORG005','Mac','High'),
	 ('S0383','ORG006','Linux','Medium'),
	 ('S0508','ORG007','Linux','High'),
	 ('S0109','ORG008','Windows','Medium'),
	 ('S0059','ORG009','Linux','Low'),
	 ('S0252','ORG010','Mac','High'),
	 ('S0432','ORG011','Linux','High'),
	 ('S0196','ORG012','Mac','Medium'),
	 ('S0013','ORG013','Windows','Low'),
	 ('S0369','ORG014','Linux','Medium'),
	 ('S0386','ORG015','Linux','Medium'),
	 ('S0342','ORG016','Mac','High'),
	 ('S0426','ORG017','Mac','High'),
	 ('S0181','ORG018','Linux','High'),
	 ('S0324','ORG019','Mac','Medium'),
	 ('S0036','ORG020','Mac','Low');

insert into activity.security_incidents (incident_id,org_id,incident_type,discovered_date,severity) VALUES
	 ('I0001','ORG001','Malware','2024-02-24','Medium'),
	 ('I0002','ORG002','Unauthorized Access','2024-03-17','Critical'),
	 ('I0003','ORG003','Data Breach','2024-02-23','Medium'),
	 ('I0004','ORG004','Malware','2024-04-01','Low'),
	 ('I0005','ORG005','Data Breach','2023-01-27','Low'),
	 ('I0006','ORG006','Malware','2023-06-15','High'),
	 ('I0007','ORG007','Malware','2024-05-06','Medium'),
	 ('I0008','ORG008','Unauthorized Access','2024-01-22','Medium'),
	 ('I0009','ORG009','Data Breach','2023-05-22','Critical'),
	 ('I0010','ORG010','Data Breach','2023-12-26','High'),
	 ('I0011','ORG011','Unauthorized Access','2024-01-01','Critical'),
	 ('I0012','ORG012','Unauthorized Access','2023-10-01','Critical'),
	 ('I0013','ORG013','Data Breach','2023-07-16','High'),
	 ('I0014','ORG014','Unauthorized Access','2023-05-06','Critical'),
	 ('I0015','ORG015','Unauthorized Access','2024-02-12','Low'),
	 ('I0016','ORG016','Malware','2023-08-28','Low'),
	 ('I0017','ORG017','Malware','2024-01-18','Medium'),
	 ('I0018','ORG018','Malware','2023-08-29','Low'),
	 ('I0019','ORG019','Malware','2023-12-02','Low'),
	 ('I0020','ORG020','Malware','2023-08-06','High');

insert into activity.login_logs (login_id,user_id,login_time,ip_address,status) VALUES
	 ('L00001','U0183','2023-11-27','192.168.49.114','Success'),
	 ('L00002','U0834','2024-04-12','192.168.190.125','Failed'),
	 ('L00003','U0116','2024-02-25','192.168.132.203','Success'),
	 ('L00004','U0638','2023-02-03','192.168.182.130','Failed'),
	 ('L00005','U1074','2023-03-11','192.168.226.146','Success'),
	 ('L00006','U0395','2023-03-30','192.168.225.214','Success'),
	 ('L00007','U0119','2024-03-04','192.168.64.9','Failed'),
	 ('L00008','U0739','2023-01-26','192.168.181.51','Failed'),
	 ('L00009','U0951','2023-07-08','192.168.130.102','Success'),
	 ('L00010','U0063','2023-12-15','192.168.62.96','Failed'),
	 ('L00011','U0914','2023-11-01','192.168.46.246','Failed'),
	 ('L00012','U1130','2023-10-28','192.168.90.89','Success'),
	 ('L00013','U0530','2024-03-04','192.168.192.213','Success'),
	 ('L00014','U0057','2023-05-26','192.168.99.13','Success'),
	 ('L00015','U1172','2024-03-13','192.168.200.248','Success'),
	 ('L00016','U0454','2024-03-14','192.168.166.58','Success'),
	 ('L00017','U1335','2023-05-18','192.168.105.132','Success'),
	 ('L00018','U1398','2024-03-18','192.168.3.122','Success'),
	 ('L00019','U0355','2023-11-28','192.168.154.206','Success'),
	 ('L00020','U0517','2023-04-25','192.168.156.207','Failed');

insert into activity.network_events (event_id,system_id,event_type,"timestamp",severity) VALUES
	 ('E00001','S0016','Login','2023-03-29','Critical'),
	 ('E00002','S0314','Login','2024-02-13','Critical'),
	 ('E00003','S0190','Network Scan','2023-02-19','High'),
	 ('E00004','S0497','File Access','2023-08-05','High'),
	 ('E00005','S0520','Login','2024-01-25','Critical'),
	 ('E00006','S0383','Login','2023-11-25','Medium'),
	 ('E00007','S0508','File Access','2024-03-18','Medium'),
	 ('E00008','S0109','Malware Alert','2024-04-18','High'),
	 ('E00009','S0059','Login','2023-04-02','Critical'),
	 ('E00010','S0252','File Access','2023-01-18','Medium'),
	 ('E00011','S0432','Network Scan','2023-01-28','High'),
	 ('E00012','S0196','Login','2024-05-15','High'),
	 ('E00013','S0013','File Access','2024-04-13','High'),
	 ('E00014','S0369','Login','2024-01-15','High'),
	 ('E00015','S0386','Login','2024-02-08','Critical'),
	 ('E00016','S0342','Login','2023-07-29','Low'),
	 ('E00017','S0426','Malware Alert','2023-06-11','High'),
	 ('E00018','S0181','File Access','2024-01-14','Low'),
	 ('E00019','S0324','Network Scan','2023-02-18','Medium'),
	 ('E00020','S0036','File Access','2023-04-16','Medium');

insert into activity.incident_systems (incident_id,system_id) VALUES
	 ('I0001','S0016'),
	 ('I0002','S0314'),
	 ('I0003','S0190'),
	 ('I0004','S0497'),
	 ('I0005','S0520'),
	 ('I0006','S0383'),
	 ('I0007','S0508'),
	 ('I0008','S0109'),
	 ('I0009','S0059'),
	 ('I0010','S0252'),
	 ('I0011','S0432'),
	 ('I0012','S0196'),
	 ('I0013','S0013'),
	 ('I0014','S0369'),
	 ('I0015','S0386'),
	 ('I0016','S0342'),
	 ('I0017','S0426'),
	 ('I0018','S0181'),
	 ('I0019','S0324'),
	 ('I0020','S0036');