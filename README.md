# DevOps AWS Learning

## Overview
This repository documents my hands-on learning journey in AWS and DevOps through structured, production-style assignments.

Each assignment focuses on a specific cloud architecture or core DevOps concept and is implemented using fully managed AWS services, following best practices around security, scalability, availability, and observability.

The goal of this repository is to demonstrate practical understanding of cloud systems by building, testing, and validating real-world architectures rather than relying on theoretical examples.



## Why AWS Matters in DevOps
AWS provides the core infrastructure primitives that DevOps teams use to design, deploy, and operate production systems at scale. It enables teams to build reliable architectures without managing physical hardware, while still retaining fine-grained control over networking, security, and system behaviour.

Through these assignments, I focus on how AWS services are used together in practice to solve real operational problems. This includes designing secure and resilient network topologies, building highly available and load-balanced applications, delivering content efficiently using managed CDN services, and implementing serverless backends that scale automatically without manual infrastructure management.

Equal emphasis is placed on security and observability. IAM is used to enforce least-privilege access between services, public endpoints are protected using HTTPS, WAF, and controlled access mechanisms, and system behaviour is validated through logs and metrics. These patterns reflect how DevOps teams design, secure, and operate cloud-native systems in real production environments.




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



## Principles and Learning Approach

Each assignment in this repository is approached as a system-building exercise rather than an isolated service configuration. The focus is on understanding end-to-end behaviour, including how requests flow through architectures, how components fail, and how security and access boundaries are enforced.

Emphasis is placed on making intentional architectural decisions. Services are configured explicitly, IAM permissions are scoped tightly, and infrastructure is designed to reflect realistic production constraints rather than convenience or default settings.

Testing, verification, and observation are treated as essential parts of implementation. Behaviour is validated using real traffic, logs, and metrics to confirm that systems operate as expected under normal conditions.

The aim of this approach is to develop strong intuition around cloud architectures, operational trade-offs, and system behaviour that aligns with real-world DevOps and cloud engineering practices.



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





## Resources

The following official documentation was referenced while designing and implementing the architectures in this repository:

- [AWS Documentation](https://docs.aws.amazon.com/)
- [Amazon VPC](https://docs.aws.amazon.com/vpc/)
- [Amazon EC2](https://docs.aws.amazon.com/ec2/)
- [Elastic Load Balancing (ALB)](https://docs.aws.amazon.com/elasticloadbalancing/)
- [Amazon S3](https://docs.aws.amazon.com/s3/)
- [AmazonoudFront](https://docs.aws.amazon.com/cloudfront/)
- [Amazon API Gateway](https://docs.aws.amazon.com/apigateway/)
- [AWS Lambda](https://docs.aws.amazon.com/lambda/)
- [Amazon DynamoDB](https://docs.aws.amazon.com/dynamodb/)
- [AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/iam/)
- [AWS WAF](https://docs.aws.amazon.com/waf/)
- [AWS Certificate Manager (ACM)](https://docs.aws.amazon.com/acm/)
- [Amazon CloudWatch](https://docs.aws.amazon.com/cloudwatch/)
- [Cloudflare DNS Documentation](https://developers.cloudflare.com/dns/)


## Security Notice
All sensitive information shown in this repository (including API keys, ARNs, account IDs, IP addresses, and domain records) has been **revoked, rotated, or removed** after validation and testing.

This repository does not contain any active credentials or publicly accessible production resources.