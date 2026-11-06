-- Total Revenue for online sales Plus the start date and end date
SELECT Sum(SalesTotal) as total_rev, ShiptoState, Min(Date) as min_date, Max(date) as max_date
FROM online_sales
where ShiptoState = 'Florida';
-- revenue breakdown by year and month for online sales
Select ProdNum, Date, SalesTotal, ShiptoState
FROM online_sales
Where ShiptoState = 'Florida'
Order by Date
 -- total rev Comparison by Florida compared to the region
Select m.Region,Sum(o.SalesTotal) as total_rev
From online_sales o  Join management m
ON o.ShiptoState = m.State
Where m.Region = 'South'
Group by m.Region;
-- Number of transactions per month and avg transaction amount by product category
SELECT
    YEAR(o.Date) AS sales_year,
    MONTH(o.Date) AS sales_month,
    ic.Category,
    COUNT(*) AS transaction_count,
    AVG(o.SalesTotal) AS avg_transaction_amount
FROM online_sales o
JOIN products p
    ON o.ProdNum = p.ProdNum
JOIN inventory_categories ic
    ON p.Categoryid = ic.Categoryid
GROUP BY
    YEAR(o.Date),
    MONTH(o.Date),
    ic.Category
ORDER BY
    sales_year,
    sales_month,
    ic.Category;
    
    -- Ranking of online sales based on states, Flordia is 10th
    Select ShiptoState, Sum(SalesTotal) as total_rev
    From online_sales
    Group by ShiptoState
    Order by total_rev Desc
    
    
    