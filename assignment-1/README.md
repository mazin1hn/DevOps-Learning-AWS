# Assignment 1 –  AWS VPC Networking Architecture (Public & Private Subnets)

## Overview
This assignment demonstrates a full custom AWS network built from scratch.  
The goal was to understand core cloud networking concepts such as VPC design, subnetting, routing, controlled internet access, and instance monitoring.



## Objective
Create a custom VPC with one public and one private subnet, configure correct routing for internet access, deploy EC2 instances across both subnets, and validate the setup using CloudWatch monitoring.



## Architecture
The architecture consists of a single VPC containing a public and a private subnet.  
An Internet Gateway provides inbound access to public resources, while a NAT Gateway enables outbound-only internet access for private instances.

The public EC2 instance also acts as a bastion host, allowing secure SSH access to the private EC2.

See the architecture diagram in:  
[View Architecture Diagram](architecture/vpc-architecture.png)



## Tasks Implemented

### 1. VPC Creation
- Created a custom VPC with CIDR block `10.0.0.0/16`
- Created one public subnet
- Created one private subnet



### 2. Internet Access
- Created and attached an Internet Gateway to the VPC
- Allocated an Elastic IP
- Created a NAT Gateway in the public subnet using the Elastic IP



### 3. Route Tables
- Public route table configured with a default route (`0.0.0.0/0`) to the Internet Gateway
- Private route table configured with a default route (`0.0.0.0/0`) to the NAT Gateway
- Each route table associated with its respective subnet



### 4. EC2 Instances
- Launched a public EC2 instance in the public subnet with a public IPv4 address
- Launched a private EC2 instance in the private subnet without a public IPv4 address
- EC2 user data scripts were used to automate instance bootstrapping

User data scripts can be found in:  
[Public EC2 User Data](user-data/public-ec2-user-data.sh)  
[Private EC2 User Data](user-data/private-ec2-user-data.sh)



### 5. Security
- Public EC2 security group allows SSH and HTTP access only from my IP
- Private EC2 security group allows inbound access only from within the VPC (via the bastion host)
- No direct internet access to the private EC2



### 6. Bastion Host
The public EC2 instance also functions as a bastion host, enabling secure SSH access to the private EC2 instance without exposing it to the internet.



### 7. CloudWatch Monitoring
Detailed CloudWatch monitoring was enabled on both EC2 instances to validate resource activity and network traffic.

This included:
- CPU utilisation metrics
- Network in/out metrics
- Packet count metrics

CloudWatch metrics were used to confirm:
- Inbound traffic reaching the public EC2
- Outbound traffic from the private EC2 via the NAT Gateway
- Normal instance behaviour after deployment



## Implementation Evidence
Step-by-step screenshots documenting the full setup are available in:  
[View Implementation Screenshots](screenshots/)

These include:
- [VPC Creation](screenshots/01-vpc.png)
- [Subnets](screenshots/02-subnets.png)
- [NAT Gateway](screenshots/05-nat-gateway.png)
- [Public EC2 HTTP Access](screenshots/09-public-ec2-http.png)
- [CloudWatch Metrics](screenshots/13-cloudwatch-metrics.png)



## What I Learned
- How public and private subnets differ in routing and accessibility
- How NAT Gateways provide outbound-only internet access
- How a bastion host enables secure administrative access
- How CloudWatch can be used to validate infrastructure behaviour



## Challenges and Solutions
A key challenge was understanding why private EC2 instances cannot access the internet directly.  
This was resolved by configuring a NAT Gateway in the public subnet and associating the correct route table with the private subnet.