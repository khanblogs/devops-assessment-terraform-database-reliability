# DevOps Assessment — Terraform & Database Reliability

Production-oriented DevOps assessment demonstrating:

- Terraform AWS infrastructure design
- VPC networking
- Application Load Balancer
- ECS Fargate
- Private RDS PostgreSQL
- Dev and Prod environment separation
- Docker Compose PostgreSQL
- Database migration and seed data
- Query optimization
- Backup and restore
- GitHub Actions Terraform validation

---

## Architecture

```text
Internet
   |
   v
ALB
   |
   v
ECS Fargate
   |
   v
Private RDS PostgreSQL
