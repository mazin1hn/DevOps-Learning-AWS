# Assignment 4 – Serverless REST API with API Gateway, Lambda, DynamoDB, IAM, Security, and Custom Domain

## Overview
This assignment demonstrates a production-style serverless REST API architecture built entirely using managed AWS services.  
The goal was to understand how API Gateway, Lambda, DynamoDB, IAM, and security services work together to deliver a scalable, secure, and observable backend without managing servers.

The API accepts HTTP requests, processes them using AWS Lambda, stores data in DynamoDB, and returns structured JSON responses.  
The solution is secured using IAM least-privilege permissions, API keys with usage plans, AWS WAF rate limiting, and HTTPS via ACM with a custom domain managed through Cloudflare DNS.



## Objective
Build a production-ready serverless REST API using Amazon API Gateway, AWS Lambda, and Amazon DynamoDB.  
The API should support creating and retrieving data, enforce security controls, provide logging and observability, and be accessible via a custom HTTPS domain.



## Architecture
The architecture consists of a public REST API exposed through Amazon API Gateway, which acts as the entry point for all client requests.

Users access the API via a custom domain managed by Cloudflare DNS.  
DNS resolves the domain to the API Gateway endpoint, which is secured using an ACM-issued SSL/TLS certificate.

API Gateway forwards incoming requests to an AWS Lambda function using proxy integration.  
The Lambda function processes the request logic and interacts with an Amazon DynamoDB table for data persistence.

Security and governance are enforced using IAM roles with least-privilege permissions, API keys with usage plans, and AWS WAF rate-based rules.  
Application logs are captured in Amazon CloudWatch for debugging and monitoring.

There is no VPC, EC2, or networking infrastructure involved, as all components are fully managed serverless services.

See the architecture diagram in:  
[View Architecture Diagram](architecture/api-architecture.png)



## Tasks Implemented

### 1. Data Storage (DynamoDB)
- Created a DynamoDB table named `students`
- Configured the partition key as `id` (string)
- Used on-demand capacity mode for automatic scaling
- Verified successful read and write operations from Lambda



### 2. Serverless Compute (Lambda)
- Created a Lambda function using the Node.js runtime
- Implemented logic to:
  - Generate a UUID for each request
  - Store `{ id, timestamp, payload }` in DynamoDB
  - Return structured JSON responses
- Added error handling for invalid requests
- Enabled CloudWatch logging for observability



### 3. API Layer (API Gateway)
- Created a REST API using Amazon API Gateway
- Implemented the following endpoints:
  - `POST /submit` – store a new student record
  - `GET /students` – retrieve stored records
- Integrated API Gateway directly with Lambda using proxy integration
- Enabled CORS to allow cross-origin requests
- Deployed the API to a production stage



### 4. Identity and Access Management (IAM)
- Created a dedicated Lambda execution role
- Applied least-privilege permissions:
  - `dynamodb:PutItem` and `dynamodb:Scan` on the `students` table
  - Basic logging permissions via `AWSLambdaBasicExecutionRole`
- Avoided over-permissive wildcard policies



### 5. API Security and Governance
- Created API keys and associated usage plans
- Enforced API key requirements on protected endpoints
- Configured request throttling and daily quotas
- Implemented AWS WAF with rate-based rules to block abusive traffic
- Associated the WAF Web ACL with the API Gateway stage



### 6. HTTPS and Custom Domain
- Requested an SSL/TLS certificate using AWS Certificate Manager (ACM)
- Configured a custom domain in API Gateway
- Mapped the API stage to the custom domain
- Integrated Cloudflare DNS using CNAME records
- Verified secure HTTPS access via the custom domain



### 7. Testing and Validation
- Tested API endpoints using `curl`
- Verified successful POST requests storing data in DynamoDB
- Verified GET requests returning stored records
- Confirmed API key enforcement by testing with and without keys
- Verified WAF rate limiting by sending rapid requests
- Checked CloudWatch logs for Lambda execution and errors
- Confirmed HTTPS functionality using the custom domain



## Implementation Evidence
Step-by-step screenshots documenting the full setup are available in:  
[View Implementation Screenshots](screenshots/)

These include:
- DynamoDB table configuration
- Lambda function code and configuration
- IAM role and policy attachments
- API Gateway resources and integrations
- API key and usage plan configuration
- WAF Web ACL and rate-limiting rules
- CloudWatch logs
- Custom domain and ACM certificate setup
- DNS configuration in Cloudflare
- Successful `curl` request outputs



## What I Learned
- How serverless APIs are built using API Gateway and Lambda
- How DynamoDB enables scalable data storage without capacity planning
- How IAM roles enforce least-privilege access between AWS services
- How API keys and usage plans control API consumption
- How AWS WAF protects APIs from abuse using rate-based rules
- How HTTPS and custom domains integrate with API Gateway
- How CloudWatch logs are used for debugging and observability
- How fully managed services remove the need for traditional infrastructure



## Challenges and Solutions
One challenge was troubleshooting `Missing Authentication Token` and `Forbidden` errors when testing API endpoints.  
This was resolved by understanding API Gateway resource paths, method configuration, and API key enforcement.

Another challenge was correctly associating API keys with usage plans and deployment stages.  
This was addressed by carefully mapping stages and verifying method-level API key requirements.

Configuring the custom domain required understanding ACM certificate validation and DNS propagation through Cloudflare.  
This was resolved by validating the certificate, creating correct CNAME records, and allowing time for DNS updates to propagate.



## Security Notice
All sensitive information displayed in this assignment (including API keys, ARNs, account IDs, IP addresses, and domain records) has been **rotated, revoked, or removed** after validation and testing.

This repository does not contain any active credentials or publicly accessible production resources.