WITH total_sales_with_Ads_3 AS (
    SELECT 
        sfc."Order_id",
        "Status",
        "Prom_web",
        "Rozetka",
        "Ad campaign",
        "Source",
        "Promo_price",
        "utm_campaign",
        sam."data",
        "Total_price",
        "Supplier_price",
        "Prom_fee",
        "NowaPay_Fee",
        "Fee"
    FROM sales_from_crm sfc 
    LEFT JOIN sales_and_margin sam  
        ON sfc."Order_id" = sam."Order_id"
)
CREATE TABLE total_sales_with_Ads_4 AS
SELECT 
    "Order_id",
    "Status",
    "Promo_price",
    "data",
    "Total_price",
    "Supplier_price",
    "Prom_fee",
    "NowaPay_Fee",
    "Fee",
    CASE 
        WHEN "Prom_web" = 'Prom' AND ("Rozetka" = '' OR "Rozetka" IS NULL) THEN 'Prom'
        WHEN "Rozetka" = 'Rozetka' THEN 'Rozetka'
        WHEN "Ad campaign" = 'Google Ads' THEN 'Google Ads'
        ELSE 'No campaing'
    END AS ad_campaign_all,
    "Source"
FROM total_sales_with_Ads_3;

DELETE FROM total_sales_with_Ads_4
WHERE data IS NULL 
  AND "Status" = 'Виконано';

SELECT 
    ad_campaign_all, 
    COUNT("Order_id") AS total_orders,
    SUM(CASE WHEN "Status" = 'Виконано' THEN 1 ELSE 0 END) AS successful_orders,
    SUM(CASE WHEN "Status" = 'Відмова' THEN 1 ELSE 0 END) AS canceled_orders,
    ROUND(SUM(CASE WHEN "Status" = 'Відмова' THEN 1 ELSE 0 END) * 100.0 / COUNT("Order_id"), 2) AS cancellation_rate_pct,
    SUM("Total_price") AS total_revenue,
    SUM("Supplier_price") AS total_supplier_rev
FROM total_sales_with_Ads_4 
GROUP BY ad_campaign_all
ORDER BY total_revenue DESC;


