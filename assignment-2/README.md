# Assignment 2 – # Highly Available Web Architecture with ALB and Auto Scaling

## Overview
This assignment demonstrates a common DevOps architecture pattern: multiple EC2 instances deployed behind an Application Load Balancer (ALB).  
The goal was to understand how load balancing, health checks, security group isolation, HTTPS termination, DNS integration, and automated scaling work together to build a highly available application setup.

All inbound traffic is handled by the ALB, while backend EC2 instances are not directly accessible from the internet.



## Objective
Deploy multiple EC2 instances behind an Application Load Balancer.  
Configure the ALB to handle all incoming traffic, distribute requests across instances, perform health checks, secure traffic using HTTPS, and automatically manage instance lifecycle using an Auto Scaling Group.



## Architecture
The architecture consists of a single VPC with two public subnets deployed across separate availability zones.  
An internet-facing Application Load Balancer spans both public subnets and distributes traffic to EC2 instances registered in a target group.

DNS resolution is handled via Cloudflare, which maps a custom domain to the ALB DNS name.  
HTTPS traffic is terminated at the ALB using an ACM-issued SSL/TLS certificate.  
An Auto Scaling Group manages the lifecycle of EC2 instances, ensuring availability and automatic recovery.

See the architecture diagram in:  
[View Architecture Diagram](architecture/alb-architecture.png)



## Tasks Implemented

### 1. EC2 Instances
- Deployed EC2 instances within the same VPC
- Instances were placed across different availability zones
- User data scripts were used to install and configure a simple web server
- Each instance returns unique content to verify load balancing behaviour

User data scripts can be found in:  
[EC2 User Data Scripts](user-data/)



### 2. Application Load Balancer
- Created an internet-facing Application Load Balancer
- Attached the ALB to two public subnets
- Configured HTTP (port 80) and HTTPS (port 443) listeners
- Associated an ACM-issued SSL/TLS certificate with the HTTPS listener
- Created a target group with health checks configured on the root path `/`



### 3. DNS and HTTPS
- Configured a custom domain using Cloudflare DNS
- Mapped the domain to the ALB DNS name
- Enabled secure HTTPS access via ACM certificate termination at the ALB
- Ensured all external access flows through the ALB



### 4. Auto Scaling Group
- Created a launch template with user data and security configuration
- Deployed an Auto Scaling Group across both public subnets
- Configured desired, minimum, and maximum capacity
- Integrated the Auto Scaling Group with the ALB target group
- Enabled ELB-based health checks to allow automatic replacement of unhealthy instances



### 5. Security Groups
- ALB security group allows inbound HTTP and HTTPS traffic from the internet
- EC2 security group allows inbound HTTP traffic only from the ALB security group
- EC2 instances are not directly accessible from the internet



### 6. Testing
- Verified access via the custom domain name
- Confirmed HTTPS functionality and valid SSL certificate
- Refreshed the application to verify traffic distribution across instances
- Confirmed all instances were healthy in the target group
- Validated Auto Scaling Group behaviour by observing instance registration and health status



## Implementation Evidence
Step-by-step screenshots documenting the full setup are available in:  
[View Implementation Screenshots](screenshots/)

These include:
- EC2 instance deployment across availability zones
- ALB creation and listener configuration
- Target group health checks
- Security group isolation
- DNS configuration via Cloudflare
- HTTPS certificate attachment
- Auto Scaling Group behaviour and instance management



## What I Learned
- How Application Load Balancers distribute traffic across availability zones
- How DNS integrates with cloud load balancing
- How HTTPS termination works using ACM
- How target groups and health checks determine instance availability
- Why backend instances should not be directly exposed to the internet
- How Auto Scaling Groups manage instance lifecycle independently of traffic flow



## Challenges and Solutions
A key challenge was diagnosing failed health checks when using Auto Scaling Groups.  
This was resolved by ensuring instances had outbound internet access for user data execution and by correctly configuring security groups and health check paths.

Another challenge was understanding the separation between traffic flow and instance lifecycle management, which was clarified by distinguishing the responsibilities of the ALB, target group, and Auto Scaling Group.