WITH customer_ltv AS(
	SELECT 
		customerkey,
		cleaned_name,
        sum(total_revenue) AS total_ltv
	FROM cohort_analysis 
	GROUP BY 
		customerkey,
		cleaned_name
	), 
	customer_segments AS (
					SELECT 
						PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25th_percentile,
						PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75th_percentile
			FROM customer_ltv
), segment_values as (
SELECT 
    c.*,
    case
		WHEN c.total_ltv < cs.ltv_25th_percentile THEN '1-low_value'
		WHEN c.total_ltv <= cs.ltv_75th_percentile THEN '2-mid_value'
		ELSE '3-high_value'
END AS  customer_segment
from 
	 customer_ltv c,
		customer_segments cs

)
select 
    customer_segment,
    sum(total_ltv) AS total_ltv,
    count(customerkey) as num_of_customers,
    sum(total_ltv) / count(customerkey) as avg_ltv
from segment_values
group by 
    customer_segment
order by
    customer_segment DESC;


