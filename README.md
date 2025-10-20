**SQL, Excel, Power BI | Classic Models**

**Project Overview**

The Classic Models project explores customer financial behavior, payment patterns, and credit exposure within a global sales dataset.
Using SQL, Excel, and Power BI, I built an end-to-end analysis that identifies customers with outstanding balances, tracks payment performance, and flags those exceeding their credit limits.

The goal was to give management a clear, data-driven view of sales performance and financial risk — helping them make informed decisions around credit control and customer engagement.

**Objectives**

Evaluate each customer’s total sales, payments, and outstanding balance.

Identify customers who have exceeded their credit limits.

Visualize sales and payment trends by region, product line, and customer type.

Strengthen financial decision-making through data insights and transparent reporting.

**Tools and Methodology**
***1. SQL (MySQL)***

SQL served as the foundation for data extraction and modeling.
I developed multi-layered Common Table Expressions (CTEs) and used window functions like LEAD() and SUM() OVER() to calculate cumulative sales, payments, and balances for each customer.

This made it possible to identify, in real time, which customers had surpassed their credit limits and how much they owed.

**Key Features:**

Joined multiple tables — Orders, OrderDetails, Customers, and Payments — for full transaction visibility.

Created dynamic calculations for:

running_total_sales – cumulative customer sales

running_total_payments – cumulative payments received

money_owed – outstanding balance

difference – remaining credit limit

This SQL foundation ensured accurate, reliable data before analysis in Excel and Power BI.

***2. Excel***

Excel was used as a validation and exploration layer before integrating data into Power BI.
I imported SQL outputs to verify data consistency, detect anomalies, and summarize results using pivot tables.

**Key Steps:**

Built pivot tables to summarize total sales and money owed by region, product, and customer.

Used conditional formatting to highlight overdue accounts and over-credit customers.

Created custom logic to check financial thresholds:

=(@running_total_sales)-(@running_total_payments)
=(@creditLimit)-((@running_total_sales)-(@running_total_payments))


Excel acted as a quality checkpoint, ensuring every metric passed consistency checks before visualization.

***3. Power BI***

Power BI transformed the validated dataset into a visual, interactive dashboard for decision-makers.
The dashboard provided real-time insights into credit risk, sales performance, and regional payment behavior.

Dashboard Highlights:

KPIs: Total Sales, Total Payments, Outstanding Balances, Over-Credit Customers

**Visuals:**

Bar chart – Sales vs. Credit Utilization by Customer

Line chart – Monthly Sales & Payments Trends

Map visual – Customer Distribution by Region

Filters: Country, Product Line, Sales Representative

These visuals made it easy to drill down into customer segments and spot emerging credit risks or sales opportunities.

**Key Insights**

Identified customers exceeding credit limits, allowing for proactive follow-up.

Found that customers with higher credit limits contributed disproportionately more to total sales.

Highlighted payment delays and outstanding balances across different countries and offices.

Improved transparency and collaboration through data-driven dashboards that simplified financial tracking.

**Project Reflection**

This project strengthened my ability to combine SQL querying, Excel validation, and Power BI visualization into one cohesive workflow.
It reinforced how data storytelling can reveal risks, improve financial decisions, and build trust across departments — a key skill I bring into every business analysis project.
