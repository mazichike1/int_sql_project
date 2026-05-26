### INTERMEDIATE SQL- SALES ANALYSIS ###
### OVERVIEW ###
Analysis of customer behaviour, customer retention and lifetime value for an e-commerce company to improve customer retention and maximize revenue

### BUSINESS QUESTIONS ###
1. Customer segmentation: Who are our most valuable customers?
2. Cohort Analysis: How do different customer groups generate revenue?
3. Retention Analysis: Which customers haven't purchased recently?

### ANALYSIS APPROACH ###


### 1. Customer segmentation ###














- Categorized customers based on total lifetime value (LTV)
- Assigned customers into high, Mid and Low segments
- Calculated key values: total revenue

Query: [1_customer_segmentation.sql](\1_customer_segmentation.sql)


### Visualizations ###
 ![1_customer_segmentation](/Scripts\2_customer_segmentation.png)

### Key Findings ###
- High-value segment (25% of customers) drives 66% of revenue ($135.4M)
- Mid-value segment (50% of customers) generates 32% of revenue ($66.6M)
- Low-value segment (25% of customers) accounts for 2% of revenue ($4.3M)

### Business Insights ###
High Value(66% revenue)
- Offer premium membership program to 12,372 vip customers
- Provide early access to new products and dedicated support
- Focus on retention as losing one customer impacts revenue significantly

Mid value( 32% revenue)
- Create upgrade paths for 24,743 customers through personalize promotions
- Target with 'next best product' recommendation based on high value patterns
- potential $66.6M -> $135.4M revenue oppurtunity if upgraded to high value

Low value(2% revenue)
- Design re-engagement campaigns for 12,372 customers to increase purchase frequency
- Test price-sensitive promotion to encourage more frequent purchases
- Focus on converting $4.3M segment to mid-value through targeted offers










































### 2. Cohort Analysis
- Tracked revenue and customer counts per cohort
- Cohorts were grouped by year of first purchase 
- Analyzed customer retention at a cohort level

Query: [2_cohort_analysis.sql](\2_cohort_analysis.sql)

*** Visualization; ***
![cohort analysis](/Scripts/2_cohort_analysis.png)

*** Key findings***
- Revenue net customers shows an alarming decreasing trend over time 
- there is a massive decline in revenue from 2022-2024
- Although net revenue is incrasing, this is likely due to a large customer base, which is not reflective of customer base.

### Business Insights ###
- Value extracted from customers is decreasing over time and needs further investigation.
- With both lowering LTV and decreasing customer acquisition, the company is failing a potential decline.

### 3. Retention Analysis ###
- Identified customers at risk of churning
- Analysed last purchase patterns
- Calculated customer- specific metrics 

Query: [3_retention_analysis.sql](/Scripts/3_retention_analysis.sql)

### Visualizations ###
![3_retention_analysis_png](/Scripts/3_retention_analysis.png)

### Key Findings ###
- Cohort churn stabilizes after 2-3 years, indicating a predictable long-term retention pattern 
- Retention rates issues are systemic rather than specific certain years 
- Newer cohorts (2022-2023) show similar churn trajectories signaling that without intervention , future cohorts will follow same pattern 

### Business Insights ###
- Streghten early enagements strategies to target the first 1-2 years with onboarding incentives, and personalized offers to improve long-term retention.
- Re-engage high value churned customers by focusing on targeted win-back campaigns rather than broad retention efforts, as reactivating valuable users may yield higher ROI
- Predict and prompt churn risk and use customer-specific warning indicators to proactively intervene with at risk users before they lapse.


### TECHNICAL DETAILS ###
- **Database:** PostgresSQL
- **Analysis tools:** PostgresSQL
- **Visualizations:** Chatgpt