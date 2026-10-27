# Sample Superstore Sales & Business Intelligence Analysis

[![SQL](https://img.shields.io/badge/Language-SQL-orange?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%7C%20MySQL-336791?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Analysis](https://img.shields.io/badge/Domain-Retail%20Analytics-green)](https://github.com/Lithishkumar33/superstore-sales-analysis)

> Exploratory business intelligence and relational database queries on the Superstore dataset. Investigates revenue drivers, regional margin variations, customer segment behavior, and the margin degradation effects of aggressive discounting strategies.

---

## 📌 Executive Summary

- **Objective**: Analyze sales, profit, order distribution, and customer segment trends across retail categories.
- **Key Findings**:
  - High discounts (>20%) sharply diminish net profit margins despite driving transaction counts.
  - Sub-categories like *Copiers* and *Phones* generate the highest operating margins, while *Tables* and *Bookcases* frequently operate at a loss due to heavy freight and promotional discounting.
  - The **Consumer** segment contributes the majority of overall revenue, but **Corporate** clients demonstrate higher average order value.

---

## 🛠️ SQL Techniques Used

- **Window Functions**: DENSE_RANK(), OVER (PARTITION BY ... ORDER BY ...), and Running Totals.
- **Common Table Expressions (CTEs)**: Modular query structures for multi-stage aggregation.
- **Conditional Logic**: CASE WHEN statements to segment discount tiers and customer lifetime bands.
- **Aggregations & Filtering**: GROUP BY, HAVING, COUNT(DISTINCT), and ROUND() for precision reporting.

---

## 📁 Repository Structure

`
superstore-sales-analysis/
│── data/
│   └── SampleSuperstore.csv  # Raw transaction dataset
│── queries.sql               # Production-grade SQL queries with comments
└── README.md                 # Analytical findings and documentation
`

---

## 👨‍💻 Author

**Lithish Kumar G**  
- **LinkedIn:** [linkedin.com/in/lithish-kumar-g-aa0b67279](https://www.linkedin.com/in/lithish-kumar-g-aa0b67279)  
- **GitHub:** [github.com/Lithishkumar33](https://github.com/Lithishkumar33)  
- **Email:** [7760lithish@gmail.com](mailto:7760lithish@gmail.com)  
