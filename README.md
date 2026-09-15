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

<img width="1536" height="1024" alt="architecture-devops" src="https://github.com/user-attachments/assets/22f7aabd-cb0e-4573-a7de-af8db0bb1357" />


```text
┌───────────────────────────────────────────────┐
│                 GITHUB / CI                   │
│                                               │
│ PR → Actions → fmt → init → validate → plan   │
└───────────────────────┬───────────────────────┘
                        │
                        ▼
┌───────────────────────────────────────────────┐
│                 TERRAFORM                     │
│                                               │
│        Modules → Dev / Prod                   │
│                                               │
│  Network → ECS/ALB → RDS                      │
└───────────────────────┬───────────────────────┘
                        │
                        ▼
┌───────────────────────────────────────────────┐
│                  AWS                          │
│                                               │
│ Internet → ALB → ECS Fargate → Private RDS    │
│                                               │
│ Public Subnets      Private Subnets           │
└───────────────────────────────────────────────┘


┌───────────────────────────────────────────────┐
│             DATABASE RELIABILITY              │
│                                               │
│ Docker Compose                                │
│      ↓                                        │
│ PostgreSQL                                    │
│      ↓                                        │
│ Migration → Seed                              │
│      ↓                                        │
│ Query → Index → EXPLAIN ANALYZE               │
│      ↓                                        │
│ Backup → Fresh DB → Restore → Verify          │
└───────────────────────────────────────────────┘
