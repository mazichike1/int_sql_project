
WITH customer_last_purchase as(
    SELECT
        customerkey,
        orderdate,
        cleaned_name,
        cohort_year,
        first_purchase_date,
        ROW_NUMBER() OVER(PARTITION BY customerkey ORDER BY orderdate DESC) AS rn
    from cohort_analysis
),
churned_customers as(
    SELECT
        cleaned_name,
        orderdate AS last_purchase_date,
        customerkey,
        cohort_year,
        CASE
            WHEN orderdate < (SELECT max(orderdate) FROM sales) - INTERVAL '6 months' THEN 'churned'
            ELSE 'Active'
        END AS customer_status
    FROM customer_last_purchase
    WHERE rn = 1
)
SELECT
    customer_status,
    cohort_year,
    count(customerkey) AS num_of_customers,
    Sum(count(customerkey)) over() AS total_customers,
    CAST(count(customerkey) AS FLOAT) * 100 / Sum(count(customerkey)) over() AS status_percentage
 
FROM
    churned_customers
GROUP BY customer_status, cohort_year;