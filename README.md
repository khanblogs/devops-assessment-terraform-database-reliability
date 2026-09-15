
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

<img width="1672" height="941" alt="flow" src="https://github.com/user-attachments/assets/1b4d29c4-5694-4ea7-a5b0-95e75f91bc16" />


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
│       Network → ECS/ALB → RDS                 │
└───────────────────────┬───────────────────────┘
                        │
                        ▼
┌───────────────────────────────────────────────┐
│                  AWS                          │
│                                               │
│ Internet → ALB → ECS Fargate → Private RDS    │
│                                               │
│    Public Subnets      Private Subnets        │
└───────────────────────────────────────────────┘


┌───────────────────────────────────────────────┐
│             DATABASE RELIABILITY              │
│                                               │
│           Docker Compose                      │
│                ↓                              │
│           PostgreSQL                          │
│                ↓                              │
│           Migration → Seed                    │
│                ↓                              │
│           Query → Index → EXPLAIN ANALYZE     │
│                ↓                              │
│          Backup → Fresh DB → Restore → Verify │
└───────────────────────────────────────────────┘
