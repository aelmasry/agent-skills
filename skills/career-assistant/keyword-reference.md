# Keyword Reference — Data Engineering & Azure

Use this reference for JD parsing and gap analysis. Not exhaustive; add JD-specific terms as they appear.

---

## Data Engineering Core

| Cluster | Keywords |
|---------|----------|
| Pipelines | ETL, ELT, data pipelines, batch processing, streaming, orchestration, scheduling |
| Modeling | data modeling, dimensional modeling, star schema, normalization, data vault |
| Storage patterns | data warehouse, data lake, lakehouse, medallion architecture, bronze/silver/gold |
| Quality | data quality, data validation, data governance, lineage, metadata |
| Integration | API integration, CDC, change data capture, incremental load, full load |
| Scale | petabyte, terabyte, high volume, real-time, near real-time |

---

## Microsoft Azure Data Platform

| Service | Keywords / aliases |
|---------|-------------------|
| Azure Data Factory | ADF, Azure Data Factory, data factory pipelines, copy activity, mapping data flows |
| Synapse Analytics | Azure Synapse, Synapse Analytics, dedicated SQL pool, serverless SQL pool, Spark pool |
| Azure SQL | Azure SQL Database, Azure SQL Managed Instance, T-SQL |
| Storage | Azure Data Lake Storage, ADLS Gen2, Blob Storage |
| Integration | Azure Event Hubs, Azure Service Bus, Azure Functions, Logic Apps |
| Compute | Azure Databricks, HDInsight (legacy) |
| Identity & security | Azure Active Directory, Entra ID, managed identity, RBAC, Key Vault |
| DevOps | Azure DevOps, CI/CD, ARM templates, Bicep, Terraform |

---

## Microsoft Fabric

| Component | Keywords |
|-----------|----------|
| Platform | Microsoft Fabric, Fabric capacity, Fabric workspace |
| Storage | OneLake, shortcut, mirroring |
| Ingestion / ETL | Data Factory in Fabric, pipelines, dataflows Gen2 |
| Lakehouse | Fabric Lakehouse, Delta tables, Spark in Fabric |
| Warehouse | Fabric Warehouse, Warehouse in Fabric, T-SQL |
| Analytics | Direct Lake, semantic model, Power BI in Fabric |
| Real-time | Real-Time Intelligence, Eventstream, KQL database |
| Governance | Purview in Fabric, lineage, endorsement |

---

## Analytics & BI

| Tool | Keywords |
|------|----------|
| Power BI | Power BI, DAX, M language, Power Query, semantic model, data model, dashboards, reports |
| Reporting | self-service BI, executive dashboards, KPIs, scorecards |
| Visualization | data visualization, storytelling with data |

---

## Languages & Frameworks

| Category | Keywords |
|----------|----------|
| SQL | T-SQL, SQL Server, query optimization, stored procedures, views, CTEs, window functions |
| Python | Python, pandas, data processing, scripting |
| Spark | Apache Spark, PySpark, Spark SQL, notebooks |
| Other | Scala, Java (when listed in JD), JSON, Parquet, Avro, Delta Lake |

---

## Cloud & Architecture

| Area | Keywords |
|------|----------|
| Architecture | cloud architecture, solution architecture, microservices, serverless |
| Patterns | event-driven, lambda architecture, hub-and-spoke |
| Containers | Docker, Kubernetes, AKS (if in JD) |
| IaC | Infrastructure as Code, Terraform, Bicep, ARM |

---

## DevOps & Practices

| Practice | Keywords |
|----------|----------|
| Version control | Git, GitHub, Azure Repos, pull requests, code review |
| CI/CD | continuous integration, continuous deployment, release pipelines |
| Agile | Agile, Scrum, sprint, backlog |
| Documentation | technical documentation, runbooks, data dictionary |

---

## Role Titles (Recruiter Search)

Common titles to align headline and summary with:

- Data Engineer
- Senior Data Engineer
- Azure Data Engineer
- Cloud Data Engineer
- Analytics Engineer
- BI Developer / BI Engineer
- Data Platform Engineer
- Fabric Data Engineer
- ETL Developer

---

## Certifications (Azure / Data)

Reference only if user holds them:

- DP-203: Data Engineering on Microsoft Azure
- DP-600: Fabric Analytics Engineer Associate
- DP-700: Fabric Data Engineer Associate
- PL-300: Power BI Data Analyst
- AZ-900, AZ-104, AZ-305 (foundational / infra)
- DP-900: Azure Data Fundamentals

---

## Gap Analysis Guidance

When a keyword is **missing**:

1. Check if user has equivalent experience under a different term (e.g., "Spark notebooks" vs "PySpark")
2. If yes → recommend reframing, not inventing
3. If no → list as gap; suggest upskilling or honest omission
4. Never add a missing technology to skills or bullets unless user confirms they used it

When a keyword is **partial**:

- Suggest adding the exact JD term alongside the existing term
- Example: "Built Spark pipelines" → "Built PySpark pipelines on Azure Databricks" (only if accurate)
