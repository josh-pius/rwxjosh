### General 
- AWS implementation of [[Directory Service (Software)]]
- Same kind of implementation of Directory as [[AWS RDS]] is to Databases
	- RDS is not a kind of DB but a platform that lets you choose and run any of multiple DB types
- Takes away the Admin overhead of running your own directory service
- Runs within a [[AWS Virtual Private Cloud (VPC)]]
	- It is a [[AWS  Public vs Private Services#AWS Private Service]]
	- For another service use the directory service the service needs to be in the VPC or you need to configure a private connection to the VPC


### High Availability
- Provides [[High Availability (HA) (Software)]] by deploying into multiple [[AWS VPC Subnet|Subnets]] within multiple [[AWS Availability Zones (AZ)]] in AWS


### AWS Services that Support Directories
- Some AWS services can support directories natively
- Windows [[AWS EC2]] can be configured to join that directory, then you login to that EC2 instance with identities in that directory
- You can configure a directory for centralized managment of windows features running on Windows EC2 instances
- Some services in AWS NEED a directory registered with AWS eg. [[AWS Workspaces]]


### Architecture
- When you create a directory for different cases you might have different architectures in mind
	- **Simple AD Mode**: You could have a isolated directory - Inside AWS only and independent of other directories
	- Integrated with an On-prem directory system
	- You can use directory service in "connct mode" where it proxies connections back to the on-prem directory service
		- This allows you to use existing on-prem directory system with AWS services that requires a directory


#### Simple AD Mode
- If we have users who'd just like to use [[AWS Workspaces]] and we don't have any directory service available to integrate to we can use simple AD
- Simple AD is a standalone directory which uses [[SAMBA (Directory Service)|SAMBA 4]]
- For the exam if we see any mention of [[Open-Source]] or Samaba think simple AD
- Simple AD can operate in two sizes
	- Small (500 users)
	- Large (5000 users)
- Can integrate with a lot of different AWS services
	- [[AWS Chime]]
	- [[AWS Connect]]
	- [[AWS QuickSight]]
	- [[AWS RDS]]
	- [[AWS WorkDocs]]
	- [[AWS WorkMail]]
	- AWS Management console lets you sign in with the users of directory service
- Anything that's capable of joining SAMBA is capable of joining the directory service
- Not designed to integrate with any existing on-prem directory system like Microsoft AD

#### AWS Managed Microsoft AD
- Useful when you already have an  existing on-prem directory but also want a presence in AWS
- You can create instance of directory service in AWS
- You can have users created in directory service in AWS which integrate with the services
- In addition it also gives you features beyond simple AD mode
	- You can have a trust relationship with the existing on-prem directory. This needs to occur over private networking either [[AWS Direct Connect (DX)]] or [[AWS Site-to-Site VPN]]
- The primary location is in AWS but trusts the on prem directory
- **Resilient**: If the VPN fails the AWS service which relies on the directory will still be able to function
- The directory service in microsoft AD mode is a fully fledged directory service in it's own right and not reliant on any on-premises infrastructure to function
- Its  an actual implementation of the microsoft active directory running 2012 R2 Mode 
	- Which means it supports microsoft applications that have Microsoft AD features such as schemas and schema extensions
	- These include services like [[Microsoft Sharepoint]] and [[MS SQL Server (Database)]] based applications
- From an exam point of view if you see questions where you need the actual microsoft active directory along with ability to trust on-prem MS active directory think AWS Managed Microsoft AD mode

#### AD Connector
- Say we wanted to use an AWS service like [[AWS Workspaces]] which requires a [[Directory Service (Software)]]
- If you already have a directory service on-prem you can leverage the same directory service via the AD connector
	- A requirement for this however is private network connectivity between the [[AWS Virtual Private Cloud (VPC)]] and On-prem directory service. This can be achieved by [[AWS Site-to-Site VPN]]
		- Once the VPN is established you'd create the AD connector and point it back at the on premises directory
	- The AD connector is just a proxy that allows you to connect the on prem Directory with AWS services and has no functionality
- If the private network connectivity fails the AD connector stops working and any services you use on AWS side that depends on AD stops working

### Picking the Right Mode
1. Simple AD: The default. Simple requirements. A directory in AWS
2. Microsoft AD: Makes sense if you have applications that need to support [[Microsoft Active Directory]] or you need to have a trust relationship with your on-prem [[Microsoft Active Directory]] 
3. AD Connectors: Use AWS Services which need a directory without storing any directory information in the cloud. It uses a proxy to your on-prem directory and has a risk of failure if the connection fails or on prem directory fails