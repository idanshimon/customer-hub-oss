# Acme Corp — Technical Architecture
<!-- EXAMPLE: Replace with your customer data -->

## Current State

### Cloud & Infrastructure
- **Primary Cloud:** AWS (us-east-1, us-west-2)
- **Secondary:** Some GCP for ML workloads
- **IaC:** Terraform (mixed maturity — some teams use it, some don't)
- **Containers:** Kubernetes (EKS) for microservices, some legacy on EC2

### Development
- **Source Control:** GitHub Enterprise Cloud (~400 developers)
- **CI/CD:** Jenkins (legacy) + GitHub Actions (newer services)
- **Languages:** Java (backend), TypeScript (frontend), Python (data/ML)
- **Monorepo vs Multi:** Multi-repo, ~180 repositories

### Observability
- **APM:** Datadog
- **Logging:** ELK stack (self-hosted)
- **Alerting:** PagerDuty

## Tech Debt & Pain Points
- Jenkins pipelines are fragile and slow (45-min builds)
- No standardized developer environment setup
- Security scanning is manual and inconsistent
- Legacy Java monolith still handles ~40% of traffic

## Risks & Open Questions
- Budget approval for platform tooling consolidation pending Q2 review
- Compliance requirements (SOC 2, HIPAA) constrain migration timeline
- Team bandwidth — 2 of 6 teams are fully allocated to legacy maintenance
