# Architecture

## Overview

This project demonstrates a production-oriented AWS architecture
using Terraform.

## Runtime Flow

Internet
↓
Application Load Balancer
↓
ECS Fargate
↓
Private RDS PostgreSQL

## Network

The architecture uses:

- One VPC
- Two Availability Zones
- Public subnets
- Private subnets

## Security

Traffic is restricted through security groups:

Internet
↓
ALB Security Group
↓
ECS Security Group
↓
RDS Security Group

RDS PostgreSQL is not publicly accessible.

## Infrastructure as Code

Terraform modules:

- network
- ecs
- rds

Environments:

- dev
- prod

## Database Reliability

Local PostgreSQL is used to demonstrate:

- schema migration
- seed data
- query optimization
- backup
- restore
- verification

## CI Validation

GitHub Actions validates Terraform using:

- terraform fmt
- terraform init
- terraform validate
- terraform plan
