# DevOps-Learning-AWS

## Overview
This repository documents my hands-on learning journey in AWS and DevOps through structured, production-style assignments.

Each assignment focuses on a specific cloud architecture or core DevOps concept and is implemented using fully managed AWS services, following best practices around security, scalability, availability, and observability.

The goal of this repository is to demonstrate practical understanding of cloud systems by building, testing, and validating real-world architectures rather than relying on theoretical examples.



## Why AWS Matters in DevOps
AWS provides the foundational building blocks used by modern DevOps teams to design, deploy, secure, and operate scalable systems.

Through these assignments, I explore how core AWS services are used in practice to:
- Design secure and resilient network architectures
- Build highly available and load-balanced applications
- Deliver content globally using managed CDN services
- Implement serverless backends without managing infrastructure
- Enforce least-privilege access using IAM
- Secure public-facing services with HTTPS, WAF, and controlled access
- Observe and debug systems using logs and metrics

These concepts form the basis of how DevOps teams build and operate production systems in cloud environments.



## Repository Structure
Each assignment is contained in its own directory and includes:
- A detailed README explaining the architecture and implementation
- An architecture diagram
- Step-by-step implementation screenshots
- Relevant configuration files or code used in the assignment

```text
.
├── assignment-1/
│   ├── README.md
│   ├── architecture/
│   ├── screenshots/
│   └── user-data/
│
├── assignment-2/
│   ├── README.md
│   ├── architecture/
│   ├── screenshots/
│   └── user-data/
│
├── assignment-3/
│   ├── README.md
│   ├── architecture/
│   └── screenshots/
│
├── assignment-4/
│   ├── README.md
│   ├── architecture/
│   ├── screenshots/
│   └── lambda/
│
└── README.md

```


## Assignments

### Assignment 1 – AWS VPC Networking Architecture
Custom VPC design with public and private subnets, Internet Gateway, NAT Gateway, EC2 instances, bastion host access, and CloudWatch monitoring.  
[View Assignment](assignment-1/)

---

### Assignment 2 – Highly Available Web Architecture with ALB and Auto Scaling
Multi-instance web architecture using Application Load Balancer, Auto Scaling Group, HTTPS termination, security group isolation, and DNS integration.  
[View Assignment](assignment-2/)

---

### Assignment 3 – Static Website Hosting with S3 and CloudFront
Serverless static website hosted on S3, distributed globally via CloudFront, secured with HTTPS using ACM, and accessed through a custom domain with Cloudflare DNS.  
[View Assignment](assignment-3/)

---

### Assignment 4 – Serverless REST API with API Gateway, Lambda, and DynamoDB
Production-style serverless REST API featuring API Gateway, Lambda, DynamoDB, IAM least privilege, API keys, usage plans, WAF rate limiting, logging, and a custom HTTPS domain.  
[View Assignment](assignment-4/)



## Technologies and Concepts Covered
- Amazon VPC, Subnets, Route Tables, Internet Gateway, NAT Gateway
- Amazon EC2, Security Groups, Bastion Hosts
- Application Load Balancer and Target Groups
- Auto Scaling Groups and health checks
- Amazon S3 static website hosting
- Amazon CloudFront CDN
- Amazon API Gateway (REST APIs)
- AWS Lambda (serverless compute)
- Amazon DynamoDB (NoSQL data storage)
- AWS Identity and Access Management (IAM)
- AWS WAF (Web Application Firewall)
- AWS Certificate Manager (ACM)
- Cloudflare DNS
- Amazon CloudWatch (logs and metrics)
- HTTPS, DNS, rate limiting, and access control



## Security Notice
All sensitive information shown in this repository (including API keys, ARNs, account IDs, IP addresses, and domain records) has been **revoked, rotated, or removed** after validation and testing.

This repository does not contain any active credentials or publicly accessible production resources.