# Assignment 3 – Static Website Hosting with S3, CloudFront CDN, HTTPS, and DNS

## Overview
This assignment demonstrates a production-style static website architecture using fully managed AWS services.  
The goal was to understand how object storage, global content delivery, caching, HTTPS, DNS, and edge security work together to deliver a fast, secure, and scalable website without managing servers.

The website is hosted on Amazon S3, distributed globally using CloudFront, secured with HTTPS via ACM, and accessed through a custom domain managed by Cloudflare DNS.



## Objective
Deploy a production-ready static website using Amazon S3 for hosting and CloudFront for global content delivery.  
Configure HTTPS using ACM, integrate a custom domain via DNS, enable caching and compression, and apply security headers at the edge.



## Architecture
The architecture consists of a static website hosted in an Amazon S3 bucket and served globally through an Amazon CloudFront distribution.

Users access the website via a custom domain managed by Cloudflare DNS, which resolves to the CloudFront distribution.  
CloudFront acts as the public entry point, providing HTTPS, caching, compression, and edge-level security.  
An ACM-issued SSL/TLS certificate is attached directly to CloudFront to secure all traffic.

There is no VPC, subnets, or EC2 infrastructure involved, as all components are fully managed AWS services.

See the architecture diagram in:  
[View Architecture Diagram](architecture/s3-architecture.png)



## Tasks Implemented

### 1. Static Website Hosting (S3)
- Created an S3 bucket for static website hosting
- Enabled Static Website Hosting on the bucket
- Uploaded a simple `index.html` homepage
- Uploaded a custom `error.html` error page
- Configured a bucket policy to allow public read access to website objects



### 2. CloudFront Distribution
- Created a CloudFront distribution with the S3 website endpoint as the origin
- Enabled HTTPS for all viewer connections
- Enabled object compression to optimise performance
- Applied AWS managed cache policy (`CachingOptimized`)
- Configured default behaviour to allow `GET` and `HEAD` requests
- Set default root object to `index.html`



### 3. DNS and HTTPS
- Requested an SSL/TLS certificate using AWS Certificate Manager (ACM) in the `us-east-1` region
- Attached the ACM certificate to the CloudFront distribution
- Configured Cloudflare DNS with a CNAME record pointing the custom domain to the CloudFront distribution domain
- Verified secure HTTPS access using the custom domain



### 4. Security Headers (CloudFront Functions)
- Created a CloudFront Function to add security headers at the edge
- Applied headers including:
  - `Strict-Transport-Security`
  - `X-Content-Type-Options`
- Associated the function with the `viewer-response` event
- Ensured headers are applied globally without involving origin servers



### 5. Testing and Validation
- Verified website access via the custom domain
- Confirmed HTTPS functionality and valid SSL certificate
- Verified CloudFront was serving content instead of the S3 endpoint
- Tested caching behaviour by:
  - Updating the `index.html` file
  - Invalidating the CloudFront cache
  - Confirming updated content was served
- Verified custom error handling using `error.html`



## Implementation Evidence
Step-by-step screenshots documenting the full setup are available in:  
[View Implementation Screenshots](screenshots/)

These include:
- S3 static website configuration
- Bucket policy for public read access
- CloudFront distribution settings
- ACM certificate attachment
- Cloudflare DNS configuration
- Cache invalidation
- Security headers verification



## What I Learned
- How static websites can be hosted without servers using S3
- How CloudFront provides global content delivery, caching, and HTTPS
- Why ACM certificates for CloudFront must be created in `us-east-1`
- How DNS integrates with CDN-based architectures
- How security headers can be applied at the edge using CloudFront Functions
- How caching affects content delivery and how to manage invalidations



## Challenges and Solutions
A key challenge was understanding why CloudFront continued serving outdated content after file updates.  
This was resolved by learning how CloudFront caching works and performing cache invalidations after content changes.

Another challenge was differentiating between CloudFront Functions and Lambda@Edge.  
This was addressed by using CloudFront Functions for lightweight response modifications such as security headers, while recognising that Lambda@Edge is more suitable for complex request and response logic.