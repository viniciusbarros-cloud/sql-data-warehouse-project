# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository!
🚀 This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights.
Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

**Objective**

Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

**Specifications**

* **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
* **Data Quality:** Cleanse and resolve data quality issues prior to analysis.
* **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.
* **Scope:** Focus on the latest dataset only; historization of data is not required.
* **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analytics)

**Objective**

Develop SQL-based analytics to deliver detailed insights into:

* Customer Behavior
* Product Performance
* Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

## 🏗️ Data Architecture

The data architecture for this project follows the **Medallion Architecture**, organizing the data flow from source to consumption through the Data Warehouse (DWH) across **Bronze**, **Silver**, and **Gold** layers.

*(Note: Ensure your image is uploaded to your repository and update the path below if necessary)*
![DWH Medallion Architecture](docs/Draw of DWH Medallion Arquiteture.png)



### 🔍 Processing Flow

1. **Source:** Data originates from CRM and ERP systems (Interface: *files in folders*; Object type: *CSV files*).
2. **DWH - Bronze:** Ingestion of raw data without additional modeling or transformations.
3. **DWH - Silver:** Application of cleaning, enrichment, and standardization rules, preparing the tables for final modeling.
4. **DWH - Gold:** Delivery of business-ready data exposed as *Views*, utilizing dimensional modeling (Star Schema) or aggregated tables.
5. **Consume:** Data from the Gold layer powers Reporting & Analysis, Ad-Hoc SQL Queries, and Machine Learning models.

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE).
You are free to use, modify, and share this project with proper attribution.

---


## 🌟 About Me

Hi there! I'm **Vinícius Barros**. I'm a data professional and passionate Analytics Engineer on a mission to share knowledge and make working with data enjoyable and engaging! 

Connect with me on [LinkedIn](https://www.linkedin.com/in/vinícius-barros-da-silva-5418b8286) or check out my other projects.
