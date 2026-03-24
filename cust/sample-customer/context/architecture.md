# Acme Healthcare — Technical Architecture

_Last updated: March 24, 2025_

---

## Current State Architecture

### Cloud Infrastructure
- **Primary Cloud:** AWS (70% workloads)
  - 3 regions: us-east-1 (primary), us-west-2 (DR), us-east-2 (dev/test)
  - EC2 fleet: ~800 instances across various sizes
  - RDS: 45 databases (Oracle, PostgreSQL, MySQL)
  - S3: 2.8 PB storage for medical imaging and backups
- **On-Premises:** VMware vSphere 7.0
  - 12 datacenters across hospital locations
  - ~600 VMs supporting clinical applications
  - NetApp storage: 850 TB across hospitals
- **Azure Footprint (emerging):** 
  - Single subscription for pilot projects
  - Azure AD Connect hybrid identity
  - Limited dev/test environments

### Application Development Stack
- **Languages & Frameworks:**
  - Java 11/17 with Spring Boot 2.7 (primary backend)
  - React 18 with TypeScript (patient portals, admin interfaces)
  - Python 3.9+ (data science, ML workflows, automation)
  - .NET Core 6 (legacy integrations, some new services)
- **Development Tools:**
  - Git repositories: Mix of GitLab (self-hosted) and GitHub Enterprise Cloud (500 seats)
  - CI/CD: Jenkins (primary), GitHub Actions (pilot)
  - Code quality: SonarQube, Checkmarx for security scanning
  - Container registry: AWS ECR, some GitHub Packages

### Data Platform
- **Primary Database:** Oracle 19c Enterprise (clinical core systems)
- **Data Warehouse:** Snowflake (3 years, growing usage)
- **Analytics:** 
  - Tableau Server (business intelligence)
  - Power BI (financial reporting)
  - Custom Python/Jupyter notebooks
- **Streaming:** Apache Kafka cluster (3 nodes) for real-time patient data
- **Integration:** MuleSoft Anypoint Platform for API management

### Clinical Core Systems
- **EHR:** Epic (MyChart, Hyperspace, Chronicles)
- **Imaging:** GE Healthcare PACS with custom React viewer
- **Lab Systems:** Cerner PathNet, custom LIMS
- **Pharmacy:** Epic Willow integrated
- **Revenue Cycle:** Epic Resolute

### Microsoft Technology Footprint
- **Productivity:** Microsoft 365 E5 (15,000 users)
  - Exchange Online, SharePoint, Teams, Power Platform
  - Active Directory hybrid with Azure AD Connect
- **Development:** GitHub Enterprise Cloud (500 seats, expanding)
- **Azure Services (pilot/limited):**
  - Azure OpenAI Service (GPT-4, embeddings for pilot RAG system)
  - Azure Kubernetes Service (dev/test environments)
  - Azure Cognitive Services (document processing POCs)

### Security & Compliance
- **Identity:** Okta SSO (primary), Azure AD (Microsoft services)
- **Network Security:** Palo Alto firewalls, Zscaler ZPA
- **Endpoint Protection:** CrowdStrike Falcon
- **Compliance Frameworks:** 
  - HIPAA (healthcare data protection)
  - SOC2 Type II (security controls)
  - FedRAMP considerations (future government contracts)

---

## Technical Challenges & Pain Points

### 1. **Developer Productivity & Tooling Fragmentation**
- **Challenge:** Mixed SCM environment (GitLab + GitHub) creates friction
- **Impact:** Developers context-switch between tools, inconsistent CI/CD patterns
- **Metrics:** Average feature delivery time: 6-8 weeks (industry average: 3-4 weeks)
- **Root Cause:** Legacy Jenkins pipelines, manual testing processes, security bottlenecks

### 2. **Data Silos & Integration Complexity**
- **Challenge:** Clinical data locked in Epic, limited real-time analytics capabilities
- **Impact:** Delayed insights for clinical decision support, manual reporting processes
- **Metrics:** 48-hour delay for key operational dashboards, 200+ manual reports
- **Root Cause:** Point-to-point integrations, batch-oriented data movement, compliance restrictions

### 3. **Hybrid Cloud Complexity**
- **Challenge:** AWS-centric but needs multi-cloud for vendor diversification
- **Impact:** Skills gap for Azure, networking complexity, duplicate security policies
- **Metrics:** 65% of infrastructure team AWS-only certified, 6-month onboarding for new cloud
- **Root Cause:** Historic AWS investment, lack of cloud-agnostic architecture patterns

### 4. **AI/ML Platform Immaturity**
- **Challenge:** No centralized ML platform, ad-hoc Python environments
- **Impact:** Limited AI adoption, compliance concerns, model governance gaps
- **Metrics:** Only 3 production ML models after 2 years of investment
- **Root Cause:** No MLOps framework, data access barriers, regulatory uncertainty

---

## Future State Vision (12-18 months)

### Target Architecture Principles
1. **Hybrid by Design:** Azure as strategic secondary cloud, AWS primary
2. **API-First:** All clinical systems accessible via standardized APIs
3. **Data-Driven:** Real-time analytics enabling clinical decision support
4. **Developer-Centric:** Unified tooling, self-service capabilities
5. **Secure by Default:** Zero-trust architecture, automated compliance

### Cloud Strategy
- **Azure Expansion:** 
  - Dedicated Azure landing zone with hub-spoke networking
  - Azure AI/ML services for clinical decision support platform
  - Azure Kubernetes Service for containerized workloads
  - ExpressRoute connectivity to primary AWS infrastructure
- **AWS Continued Use:**
  - Epic hosting and clinical core systems remain on AWS
  - Data lake and analytics workloads (Snowflake, Kafka)
  - Disaster recovery and backup infrastructure
- **Workload Distribution Target:** 60% AWS, 35% Azure, 5% on-premises

### Application Modernization
- **Containerization:** 80% of applications containerized within 18 months
- **Microservices:** Break apart monolithic patient portal into domain services
- **Unified CI/CD:** GitHub Actions across all repositories, sunset Jenkins
- **Security Integration:** Automated security scanning in all pipelines

### Data & AI Platform
- **Azure AI Platform:**
  - Azure OpenAI for clinical NLP and documentation assistance
  - Azure Machine Learning for predictive analytics
  - Azure Cognitive Services for medical imaging analysis
- **Unified Data Access:** 
  - FHIR APIs for clinical data access
  - Real-time streaming from Epic to Azure Event Hubs
  - Power BI embedded in clinical workflows

### Developer Experience
- **Unified SCM:** Complete GitHub Enterprise migration
- **Inner Source:** Shared component libraries across teams
- **AI-Assisted Development:** GitHub Copilot for all 500 developers
- **Self-Service Infrastructure:** Terraform modules, automated provisioning

---

## Integration Points

### Epic → Azure Data Pipeline
```mermaid
graph LR
    A[Epic Chronicles] --> B[HL7 FHIR API]
    B --> C[Azure Event Hubs]
    C --> D[Azure Stream Analytics]
    D --> E[Azure Data Lake]
    E --> F[Azure OpenAI RAG]
    F --> G[Clinical Decision Support]
```

### GitHub Enterprise Architecture
```
GitHub Enterprise Cloud (Primary)
├── Clinical Apps Organization
├── Infrastructure Organization  
├── AI/ML Organization
└── Shared Libraries Organization

Integration Points:
├── Azure AD SSO
├── GitHub Actions → Azure DevOps
├── Security: Dependabot, CodeQL
└── Compliance: Branch protection, audit logs
```

### Network Architecture (Future State)
```
                [Acme WAN]
                     |
    ┌─────────────────────────────────┐
    |                                 |
[AWS VPC]                     [Azure VNet]
├── Epic Production            ├── AI/ML Platform
├── Data Lake (S3)            ├── AKS Clusters  
├── Analytics (Snowflake)     ├── Azure OpenAI
└── Legacy Applications       └── Power BI Premium
    |                                 |
    └─────────ExpressRoute────────────┘
```

---

## Technology Roadmap

### Q2 2025 (Apr-Jun)
- ✅ Azure landing zone deployment
- ✅ GitHub Enterprise full migration (500 users)
- ⏳ Azure OpenAI clinical pilot (RAG for medical documentation)
- ⏳ Containerize patient portal (React frontend, Java backend)

### Q3 2025 (Jul-Sep)
- Azure Kubernetes Service production deployment
- Power BI embedded in Epic workflows
- GitHub Copilot expansion (additional 300 users)
- Real-time clinical data streaming (Epic → Azure)

### Q4 2025 (Oct-Dec)
- AI clinical decision support MVP
- Unified monitoring (Azure Monitor + AWS CloudWatch)
- Infrastructure as Code (Terraform for both clouds)
- Security automation (policy as code)

### Q1 2026 (Jan-Mar)
- Multi-cloud disaster recovery testing
- Advanced AI models for clinical imaging
- Developer self-service platform launch
- Technical debt reduction (legacy system retirement)

---

## Success Metrics

### Developer Productivity
- **Current:** 6-8 weeks average feature delivery
- **Target:** 3-4 weeks by Q4 2025
- **Measurement:** GitHub insights, deployment frequency

### Infrastructure Efficiency  
- **Current:** 72% average resource utilization
- **Target:** 85% utilization, 20% cost reduction
- **Measurement:** Azure Cost Management, AWS Cost Explorer

### AI/ML Adoption
- **Current:** 3 production ML models
- **Target:** 15 production models by Q1 2026
- **Measurement:** Azure ML model registry, clinical outcome metrics

### Security Posture
- **Current:** 95% compliance score (internal audit)
- **Target:** 98% compliance, zero critical vulnerabilities
- **Measurement:** Microsoft Secure Score, automated scanning reports