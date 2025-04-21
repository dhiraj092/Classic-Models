**Project Background**

Classic Models is a fictional but comprehensive database used for simulating real-world business analytics. It contains data for a company that sells miniature models of classic cars. The dataset includes details on products, customers, orders, sales representatives, and offices worldwide.
In this project, I worked as a Data Analyst tasked with answering key business questions to help the executive team make data-driven decisions. Using SQL, I built multiple views and analyses to uncover insights into product performance, customer behavior, profitability, and operational risks. These views were designed to be integrated directly into Power BI for visual reporting.


**Executive Summary**

This analysis provides a data-driven breakdown of:
•	Product level profitability
•	Regional sales performance
•	Customer credit risk
•	Purchase pattern trends
•	Operational logistics, including shipment delays
•	Are customers exceeding their credit limits?

The SQL views created serve as a foundation for a business intelligence solution. They enable sales managers, finance teams, and operations staff to access clean, analytical data for decision-making — without needing to write complex SQL themselves.

**Insights Deep-Dive**

**Product Affinity Analysis: What is Bought Together?**

*Business Question:*

Are there any specific products frequently bought together? Are there combinations that never appear in the same cart?

*SQL Approach:*
A self-join on the orderdetails table was performed using the same orderNumber, filtering out identical product combinations (product A with product A), and counting distinct orders.

Sample Output Columns:
•	product_1
•	product_2
•	times_bought_together

Insight:
•	Helps marketing and sales to identify potential bundling or upselling opportunities.
•	Rarely combined items may indicate segmentation in customer preference or seasonality.

**Sales by Customer Credit Limit Groups**

*Business Question:*

Do customers with higher credit limits generate more revenue?

*SQL Approach:*
•	Customers were grouped by credit limit (e.g., <75K, 75K–100K, 100K–150K, etc.).
•	Sales values were aggregated by each group using joins between customers, orders, and orderdetails.

*Insight:*
•	The trend indicates whether increasing customer credit limits results in higher average order values.
•	Enables Finance to optimize credit terms based on performance.


**Purchase Value Change (First-time vs Repeat Customers)**

*Business Question:*

Are new customers spending more or less than they did on their last purchase?

*SQL Approach:*
•	LAG() was used to compare a customer’s current purchase with their previous one.
•	ROW_NUMBER() assigned order history per customer to analyze purchase patterns chronologically.

Insight:

•	First-time purchase value is often high, but second orders may drop — indicating a need for follow-up engagement or satisfaction feedback.
•	Customers with increasing order value may be candidates for loyalty programs or cross-selling.

**Office Sales and Customer Locations**

*Business Question:*

Where are the customers of each office located, and what is their sales performance?

*SQL Approach:*
•	A view was created that joins offices, employees, customers, orders, and orderdetails.
•	Grouped by office and customer geography to assess geographic distribution of business.

*Insight:*
•	Reveals performance by sales office and helps determine territory expansion or restructuring needs.
•	Identifies whether certain offices are underperforming due to customer distribution.

**Customer Sales & Outstanding Balance vs Credit Limit**

*Business Question:*

Which customers have exceeded their credit limit? How much do they owe?

*SQL Approach:* 

This was one of the most	 complex queries involving multiple CTEs:
1.	Sales per Order
Captured each order’s value.
2.	Running Totals
Used SUM() and LEAD() to track cumulative sales and timing between orders.
3.	Payments View
Pulled and aligned customer payment history.
4.	Final Join
Compared cumulative payments vs. sales to calculate:
o	money_owed
o	credit_limit_remaining

*Insights:*

•	Identifies customers who’ve gone over their credit limit.
•	Enables Finance to flag at-risk accounts.
•	Provides justification for follow-ups or credit limit reevaluation.


**Recommendations**
1.	Bundle Products That Sell Together:
Leverage co-purchase analysis to create bundle promotions and recommend products at checkout.
2.	Review Credit Policy by Segment:
Customers with high credit limits tend to spend more. Consider gradually increasing limits for reliable customers.
3.	Focus on Customer Retention Post-First Order:
Use CRM strategies to keep new customers engaged after their first purchase, especially if second purchases trend downward.
4.	Office Expansion in High Potential Cities:
Analyze underserved cities with high customer density and consider targeted outreach or assigning dedicated sales reps.

