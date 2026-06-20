# 🛒 Superstore Sales Performance Dashboard
### End-to-End Business Intelligence | MySQL · Power BI · SQL

![Dashboard Preview](Images/dashboard.png)

---

## 📌 Project Overview

Analyzed **4 years of retail sales data** (2020–2023) from the Sample Superstore dataset to uncover profitability drivers, regional performance gaps, and category-level trends — delivered as an interactive Power BI dashboard connected to a structured MySQL database.

**Business Question:** *Which regions, categories, and customer segments are driving profit — and which are dragging it down?*

---

## 📊 Key Findings

| Metric | Value |
|---|---|
| Total Sales | $2.30M |
| Total Profit | $286.4K |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Profit Margin | ~12.5% |

- 🏆 **West region** generated the highest profit ($106K+)
- 💻 **Technology** was the top category by both sales and profit
- 📦 **Furniture** had high sales but the lowest profit margin — a hidden drag
- 🗺️ **Central region** underperformed despite mid-level sales volume
- 👤 **Consumer segment** drove the most orders but **Corporate** had better margin

---

## 🗂️ Repository Structure

```
superstore-sales-dashboard/
│
├── SQL/
│   └── superstore_analysis.sql       # Full SQL analysis script (DDL + queries)
│
├── PowerBI/
│   └── Superstore_Dashboard.pbix     # Power BI dashboard file
│
├── Dataset/
│   └── Sample_Superstore.csv         # Source dataset
│
├── Images/
│   ├── dashboard.png                 # Dashboard screenshot
│   └── sql_queries.png               # SQL query results screenshot
│
├── docs/
│   └── dashboard_summary.md          # Business insights write-up
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database creation, data loading, SQL analysis |
| **MySQL Connector** | Power BI ↔ MySQL live connection |
| **Power BI Desktop** | Dashboard design, DAX measures, visualizations |
| **Excel / CSV** | Data source (Sample Superstore) |

---

## ⚙️ Project Workflow

```
Raw CSV Data
     ↓
MySQL Database (schema + import)
     ↓
SQL Analysis (aggregations, rankings, filters)
     ↓
Power BI Connection (MySQL Connector)
     ↓
Interactive Dashboard (KPIs, charts, slicers)
     ↓
Business Insights
```

---

## 📐 Dashboard Features

- **KPI Cards** — Total Sales, Profit, Orders, Customers
- **Sales by Category** — Bar chart comparison across 3 categories
- **Profit by Region** — Regional breakdown with West leading
- **Sales Trend Over Time** — Monthly line chart (2020–2023)
- **Sub-Category Performance** — Granular profitability view
- **Interactive Slicers** — Filter by Region, Category, Segment, Year

---

## 🗄️ SQL Highlights

```sql
-- Top 5 most profitable sub-categories
SELECT Sub_Category,
       ROUND(SUM(Sales), 2)  AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 5;
```

> Full SQL script → [`SQL/superstore_analysis.sql`](SQL/superstore_analysis.sql)

---

## 💡 Business Insights

1. **Furniture is a profit trap** — It ranks #2 in sales but generates the least profit. Pricing or discount strategy needs review.
2. **West region is the growth engine** — Allocating more marketing spend here has the highest ROI potential.
3. **Technology drives both volume and margin** — Prioritizing this category in inventory planning is data-backed.
4. **Central region is underperforming** — Sales are moderate but profit lags — worth a root cause investigation.
5. **Corporate customers are more profitable per order** — A B2B sales focus could improve overall margin.

---

## 🚀 How to Run This Project

### Option 1 — Power BI only (quick view)
1. Download `PowerBI/Superstore_Dashboard.pbix`
2. Open in Power BI Desktop
3. Use built-in CSV connection if MySQL isn't configured

### Option 2 — Full MySQL + Power BI setup
1. Import `Dataset/Sample_Superstore.csv` into MySQL using the script in `SQL/`
2. Open Power BI → Get Data → MySQL Database
3. Connect to your local MySQL instance → load the `superstore` table
4. Open `Superstore_Dashboard.pbix`

---

## 👩‍💼 About

**Preethi Vudugula** — M.S. Business Analytics, University of New Haven  
📎 [Portfolio](https://vudugula-preethi-portfolio.vercel.app/) · [LinkedIn](https://www.linkedin.com/in/preethi-vudugula-92a650290/) · [GitHub](https://github.com/Preethi-Vudugula)
