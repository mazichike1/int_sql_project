WITH customer_revenue AS (
         SELECT s.orderdate,
            s.customerkey,
            sum(s.quantity * s.netprice * s.exchangerate) AS total_revenue,
            count(s.orderkey) AS num_of_orders,
            c.givenname,
            c.surname,
            c.age,
            c.countryfull
           FROM sales s
             LEFT JOIN customer c ON c.customerkey = s.customerkey
          GROUP BY s.orderdate, s.customerkey, c.givenname, c.surname, c.age, c.countryfull
        )
 SELECT 
 		customerkey,
 		orderdate,
 		total_revenue,
 		num_of_orders,
 		countryfull,
 		age,
 		CONCAT(TRIM(givenname), ' ', TRIM(surname)) AS cleaned_name,
    min(orderdate) OVER (PARTITION BY customerkey) AS first_purchase_date,
    EXTRACT(year FROM min(orderdate) OVER (PARTITION BY customerkey)) AS cohort_year
   FROM customer_revenue cr;
