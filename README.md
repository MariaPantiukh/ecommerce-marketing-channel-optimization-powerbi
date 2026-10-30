# 📊 E-commerce Marketing & Channel Performance Analytics (Power BI)

## 🎯 Business Problem & Context
As an e-commerce business owner, managing advertising spend across multiple platforms (Google Ads, Prom, and Rozetka) requires strict monitoring of unit economics. The core business question of this project was: **How effective is customer acquisition across Google Ads, Prom, and Rozetka, and which channels are actually driving profit versus burning budget?**

## 🛠️ Tech Stack & Data Pipeline
To solve this, I built an end-to-end analytical pipeline:
* **Google Sheets:** Initial data cleaning, handling missing values, and formatting raw export files.
* **SQL:** Data aggregation, structuring, and metric calculations.
* **Power Query (M):** Table transformations, data typing, and preparing clean tables for loading.
* **Data Modeling:** Designed a relational star schema connecting multiple tables to unify disparate data sources.
* **DAX & Power BI:** Created custom measures and interactive dashboards (Core Metrics & Campaign Performance).
  
<img width="584" height="329" alt="Знімок екрана 2026-10-29 163824" src="https://github.com/user-attachments/assets/9f6facb4-fb94-43c6-bd88-5a7306667b53" />

## 📈 Key Insights & Findings
* **Google Ads Inefficiency:** Google Ads showed a disproportionately **high cancellation rate (67.28%)** and experienced periods of **negative contribution margin**. 
* **The Scale Disconnect:** Crucially, a decrease in profit margin did *not* correlate with a decrease in order volume. This indicates that campaigns were driving untargeted traffic (high cancellations) or burning budget higher than actual return (low ROMI/ROAS).
* **Channel Comparison:** While Prom and Rozetka demonstrated healthy unit economics, Google Ads dragged down overall profitability due to poor audience relevance and unoptimized bidding.

<img width="590" height="332" alt="Знімок екрана 2026-10-29 163833" src="https://github.com/user-attachments/assets/1fdf348d-3e94-4dbf-93cb-889b8bb3b5eb" />


## 💡 Business Recommendations
1. **Google Ads Adjustment:** Pause or heavily restructure current Google Ads campaigns to stop burning budget on non-converting, high-cancellation traffic.
2. **Performance Max Tuning:** Set a higher profitability/ROAS threshold in Performance Max settings to filter out low-intent users and focus only on high-margin buyers.

