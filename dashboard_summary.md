# Dashboard Business Summary
## Superstore Sales Performance | Preethi Vudugula

---

### What This Analysis Answers

This dashboard was built to answer a real business question: **where is the Superstore making money — and where is it quietly losing it?**

The data spans 4 years (2020–2023) across 3 product categories, 4 regions, and 3 customer segments.

---

### Finding 1 — Furniture Is a Profit Trap
Furniture generates $742K in sales (32% of total) but only $18K in profit — a margin of barely 2.5%.

Technology, by contrast, delivers $836K in sales at a 17% margin.

**Implication:** The business is moving furniture volume at near-zero return. A discount reduction or supplier renegotiation could unlock $30–50K in hidden profit without a single new customer.

---

### Finding 2 — The West Region Is the Growth Engine
The West accounts for 31% of total profit despite being one of four regions.

**Implication:** Marketing and inventory investment in West-region SKUs has the highest demonstrated ROI. Replicating what works in the West (category mix, pricing, customer targeting) in the Central region is a data-backed growth lever.

---

### Finding 3 — High Discounts Are Destroying Margin
Orders with discounts above 40% show negative average profit per order.

**Implication:** Discounting strategy is not driving profitable volume — it's subsidizing sales at a loss. A discount cap policy (max 20%) could protect margin without significant sales volume impact.

---

### Finding 4 — Corporate Customers Are More Valuable Per Order
Despite fewer orders than Consumer, Corporate segment has a higher average order value and profit per order.

**Implication:** A targeted B2B or account-based sales motion — even a small outbound push to Corporate clients — would improve overall margin mix.

---

### Finding 5 — Central Region Needs Investigation
Central sits mid-tier in sales but bottom-tier in profit. The margin gap between Central and West is significant and unexplained by category mix alone.

**Implication:** This warrants a root cause drill-down: Are Central orders more discounted? Different product mix? Higher return rates? This is exactly the kind of question a Business Analyst would bring to leadership with a recommended next step.

---

### Methodology Notes

- Dataset: Sample Superstore CSV (public dataset, ~10,000 rows)
- Database: MySQL — raw data loaded via `LOAD DATA INFILE`, structured with DDL
- Transformation: No external ETL — all aggregation done in SQL and Power BI
- Visuals: KPI cards, bar charts, line trend, regional breakdown, interactive slicers
- Connection: Live MySQL → Power BI via MySQL Connector (not import mode)

---

*Preethi Vudugula | M.S. Business Analytics, University of New Haven*  
*[Portfolio](https://vudugula-preethi-portfolio.vercel.app/) | [LinkedIn](https://www.linkedin.com/in/preethi-vudugula-92a650290/)*
