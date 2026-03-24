# Acme Healthcare — Competitive Landscape

_Last updated: March 24, 2025_

---

## Amazon Web Services (AWS)

### Status at Account: **EMBEDDED**

### What They Sell
- **AWS Cloud Infrastructure** — EC2, RDS, S3, VPC, CloudFormation
- **AWS AI/ML Services** — SageMaker, Bedrock, Comprehend Medical, Textract
- **AWS Healthcare Solutions** — HIPAA-eligible services, Epic on AWS, healthcare data lake

### What They Do Here
- **Primary cloud provider** since 2019 migration — 70% of all workloads
- **Epic EHR hosting** — Production Epic environment on AWS (us-east-1, us-west-2 for DR)
- **Data lake infrastructure** — S3 for medical imaging (2.8 PB), analytics workloads
- **Legacy application hosting** — ~800 EC2 instances supporting clinical and administrative systems

### Their Champion
- **Marcus Rivera** — Sr Director Infrastructure — *"AWS has been reliable for our Epic deployment. They understand healthcare compliance and our team knows their services well."*
- **Jennifer Torres** — Lead Cloud Architect — Strong AWS certification background, advocates for AWS-native solutions

### Scale / Depth
- **Annual Spend:** ~$2.8M (65% of total cloud budget)
- **Tenure:** 6 years (since 2019 Epic migration)
- **Team Expertise:** 8 of 12 infrastructure engineers AWS-certified
- **Workload Depth:** Mission-critical Epic, patient portal, clinical data systems

### Where They Overlap With Us
- **Cloud infrastructure** — Azure positioning as strategic secondary cloud
- **AI/ML platform** — AWS Bedrock vs. Azure OpenAI for clinical decision support
- **Data analytics** — AWS analytics stack vs. Azure AI + Power BI integration
- **Container platform** — EKS vs. AKS for application modernization

### Our Position
- **Strengths vs. them:** 
  - Better AI/ML healthcare solutions (Azure OpenAI GPT-4 for clinical use)
  - Existing Microsoft relationship ($2.1M annual spend, M365 adoption)
  - Stronger Power BI integration for clinical workflows
  - GitHub Copilot + Azure DevOps for developer productivity
- **Weaknesses vs. them:** 
  - Deep Epic integration and proven reliability on AWS
  - Team expertise and comfort with AWS services
  - Existing data lake and analytics investments
  - Lower switching costs for infrastructure expansion
- **Strategy:** **Coexistence** — Position Azure for AI/ML and modern workloads, AWS for Epic and legacy systems

### Key Intel
- **Recent moves:** Evaluating AWS HealthLake for FHIR data, but concerned about lock-in
- **Renewal timeline:** Enterprise agreement expires December 2025
- **Customer sentiment:** *"AWS works well for our current needs, but we need innovation in AI. They're slow to deliver healthcare-specific AI solutions."* — Dr. Patel
- **Competitive pressure:** Pricing conversations for AI workloads, customer comparing Azure OpenAI vs. Bedrock costs

---

## Google Cloud Platform (GCP)

### Status at Account: **EVALUATING**

### What They Sell
- **Google Cloud AI Platform** — Vertex AI, Healthcare AI, Med-PaLM, AutoML
- **Google Cloud Healthcare APIs** — FHIR, HL7, DICOM data management
- **Google Cloud Data Platform** — BigQuery, Dataflow, Cloud Storage for healthcare analytics

### What They Do Here
- **AI/ML evaluation** for clinical decision support platform (competing with Azure AI)
- **Healthcare API assessment** for FHIR data standardization project
- **Pilot consideration** for medical imaging analysis (radiology workflow automation)

### Their Champion
- **Dr. Rajesh Patel** — Chief AI Officer — *"Google's Med-PaLM and healthcare AI research is impressive. They have credibility in clinical AI that others don't."*
- **Michael Chen** — Data Science Manager — Advocates for Google's AI/ML capabilities based on academic research

### Scale / Depth
- **Current Spend:** $0 (evaluation phase only)
- **Evaluation Scope:** $350K AI platform opportunity
- **Timeline:** 6-month evaluation period (January - June 2025)
- **Pilot Interest:** Medical imaging analysis, clinical documentation assistance

### Where They Overlap With Us
- **AI/ML platform** — Direct competition for Azure AI platform opportunity
- **Healthcare data APIs** — Google Healthcare API vs. Azure Health Data Services
- **Clinical AI models** — Med-PaLM vs. Azure OpenAI GPT-4 for healthcare
- **Analytics integration** — BigQuery vs. Azure Synapse + Power BI

### Our Position
- **Strengths vs. them:**
  - Existing Microsoft relationship and enterprise agreement
  - Better integration with current Microsoft stack (M365, Power BI, GitHub)
  - Proven enterprise security and compliance (Azure Government, healthcare)
  - Stronger partner ecosystem for healthcare implementations
- **Weaknesses vs. them:**
  - Google's healthcare AI research reputation (Med-PaLM, DeepMind Health)
  - More competitive pricing on AI/ML workloads
  - Better integration with open-source ML frameworks
  - Strong analytics capabilities with BigQuery
- **Strategy:** **Displacement** — Leverage existing Microsoft relationship, enterprise integration, and healthcare compliance story

### Key Intel
- **Evaluation timeline:** Decision expected by May 2025 for AI platform
- **Technical preference:** Dr. Patel impressed by Google's clinical AI research
- **Business concern:** David Chen worried about multi-vendor complexity: *"Adding a third major cloud vendor creates operational overhead we can't afford."*
- **Competitive dynamics:** Google offering aggressive pricing (40% below Azure list) to win initial footprint

---

## Competitive Summary

| Vendor | Status | Focus Area | Our Strategy | Risk Level |
|:-------|:-------|:-----------|:-------------|:----------:|
| **AWS** | Embedded | Infrastructure, Epic hosting | Coexistence | 🟡 Medium |
| **Google Cloud** | Evaluating | AI/ML platform, healthcare APIs | Displacement | 🔴 High |
| **Cursor/Codeium** | Piloting | Developer productivity tools | Direct compete | 🟡 Medium |
| **Snowflake** | Embedded | Data warehouse, analytics | Coexistence | 🟢 Low |

---

## Win/Loss History

| Date | Opportunity | Competitor | Result | Key Factor |
|:-----|:------------|:-----------|:-------|:-----------|
| 2025-01-15 | M365 E5 Renewal ($2.1M) | Google Workspace | **Won** | Teams adoption, compliance features |
| 2024-11-30 | GitHub Enterprise ($240K) | GitLab Premium | **Won** | Developer productivity, Copilot roadmap |
| 2024-09-20 | Analytics Platform ($450K) | Azure Synapse | **Lost** | Existing Snowflake investment, team expertise |
| 2024-06-10 | Cloud Security ($180K) | AWS Security Hub | **Won** | Microsoft Security integration |
| 2024-03-25 | Container Platform ($120K) | AWS EKS | **Lost** | Existing AWS relationship, team skills |

### Win/Loss Analysis
- **Overall Win Rate:** 60% (3 wins, 2 losses)
- **Microsoft vs. AWS:** 1-1 (split decision, depends on incumbent advantage)
- **Microsoft vs. Google:** 1-0 (early lead, but high-stakes AI battle ahead)
- **Key Success Factors:** 
  1. Leverage existing Microsoft relationship (67% of wins)
  2. Developer productivity and experience (50% of wins)
  3. Integration with Microsoft stack (50% of wins)

---

## Competitive Intelligence & Positioning

### AWS Positioning
- **Don't fight Epic hosting** — acknowledge AWS strength, position Azure for innovation
- **Emphasize multi-cloud** — Azure as strategic secondary for AI/ML and modern workloads
- **Cost optimization story** — show how Azure AI reduces overall AWS compute costs
- **Developer productivity** — GitHub + Azure DevOps vs. AWS CodeCommit + CodePipeline

### Google Cloud Counter-Strategy
- **Enterprise relationship** — emphasize 6-year Microsoft partnership vs. new vendor risk
- **Integration complexity** — multi-cloud operations overhead, team skill requirements
- **Security and compliance** — Azure Government, healthcare certifications vs. Google's consumer focus
- **Ecosystem support** — Microsoft healthcare partner network vs. Google's limited healthcare ISV partnerships

### Messaging Framework

#### Against AWS (Coexistence)
- *"AWS is great for your Epic infrastructure. Azure is perfect for your AI future."*
- *"Why build AI/ML on expensive EC2 when Azure offers native AI services at 40% lower cost?"*
- *"Your developers love GitHub Copilot. Imagine that productivity across your entire Azure platform."*

#### Against Google (Displacement)
- *"Google's AI research is impressive. Microsoft's AI platform is production-ready for healthcare."*
- *"You already trust Microsoft with 15,000 users on M365. Extend that trust to your AI platform."*
- *"Integration matters. Azure AI works seamlessly with your Power BI, Teams, and GitHub workflows."*

---

## Competitive Account Plan

### Immediate Actions (Next 30 Days)
1. **AWS Relationship Management:** Schedule joint briefing with AWS on multi-cloud strategy
2. **Google Displacement:** Accelerate Azure AI POC to demonstrate superior integration
3. **Competitive Proof Points:** Compile Azure AI healthcare customer references
4. **Partner Leverage:** Engage Deloitte to advocate for Azure AI platform choice

### Long-term Strategy (Next 6 Months)
1. **Expand Azure footprint** through AI/ML workloads (beachhead strategy)
2. **Demonstrate value** with measurable clinical outcomes from Azure AI
3. **Build Azure expertise** in customer team through training and certification
4. **Position for AWS renewal** with hybrid cloud value proposition

### Success Metrics
- **Azure consumption growth:** +150% by Q4 2025
- **Competitive displacement:** Win AI platform vs. Google Cloud (June 2025)
- **Market share expansion:** Increase from 15% to 35% of Acme's cloud workloads
- **Customer advocacy:** NPS score >50 for Azure services by end of 2025