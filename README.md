Project Overview
A financial report was prepared for a credit card company using data sourced from Kaggle (credit_card.csv and customer.csv). After downloading, the data was cleaned and formatted using SQL. The report was based on weekly data for the year 2023.
Data Sources
credit_card.csv: Contains transaction details.
customer.csv: Contains customer demographic information.
Tools & Technologies
SQL & Excel: Used for data extraction, cleaning, and transformation.
Power BI: Employed for creating interactive dashboards and visualizations.
Report Highlights
The report monitored total revenue across different categories, such as types of chips used, job profiles of customers, education levels, and different types of expenditures for which the credit card was used.
Key Insights
Total Revenue: For the year 2023, the total revenue earned was $55M, with total interest earned being $7.84M.
Card Usage: The Blue card was the most used, generating up to 83% of the revenue.
Expenditure Categories: Credit cards were frequently used for bill payments, while entertainment and travel showed the least usage.
Age Group Revenue: The age group 50-55 contributed 21.57% of the total revenue earned.
Quarterly Trends: Quarter 3 recorded the highest revenue, predominantly from customers with a businessman job profile.
Customer Satisfaction: The average customer satisfaction score was 3.19. Female customers were slightly more satisfied with an average score of 3.20.
Geographical Insights: Top states were identified, with a significant portion of the revenue ($34.9M) generated through card swipes, and $14M of that from card owners.



DAX Query for Power Bi:-
1. %_change = DIVIDE(('public credit_card_details'[current_week_revenue]-'public credit_card_details'[previous_week_revenue]),('public credit_card_details'[previous_week_revenue]))

2.  current_week_revenue = CALCULATE(
    SUM('public credit_card_details'[total_revenue_earned]),
    FILTER(
        ALL(
            'public credit_card_details'),
            'public credit_card_details'[week_number] = MAX('public credit_card_details'[week_number])
    )
    )

3. previous_week_revenue = CALCULATE(
    SUM('public credit_card_details'[total_revenue_earned]),
    FILTER(
        ALL(
            'public credit_card_details'),
            'public credit_card_details'[week_number] = MAX('public credit_card_details'[week_number])-1
    )
    )

4. total_revenue_earned = 'public credit_card_details'[annual_fees]+'public credit_card_details'[interest_earned]+'public credit_card_details'[total_trans_amt]

5. week_number = WEEKNUM('public credit_card_details'[week_start_date])

6. age_group = SWITCH(
                TRUE(),
                'public customer_detail'[customer_age] < 25, "Less than 25",
                'public customer_detail'[customer_age] >= 25 && 'public customer_detail'[customer_age] < 30, "B/W 25-30",
                'public customer_detail'[customer_age] >= 30 && 'public customer_detail'[customer_age] < 40, "B/W 30-40",
                'public customer_detail'[customer_age] >= 40 && 'public customer_detail'[customer_age] < 45, "B/W 40-50",
                'public customer_detail'[customer_age] >= 50 && 'public customer_detail'[customer_age] < 55, "B/W 50-55",
                'public customer_detail'[customer_age] >= 55, "Above 55",
                "unknown"
)
7. cust_inc_cat = SWITCH(
                TRUE(),
                'public customer_detail'[income] < 25000,"Low",
                'public customer_detail'[income] >= 25000 && 'public customer_detail'[income] < 35000, "Medium Low",
                'public customer_detail'[income] >= 35000 && 'public customer_detail'[income] < 70000, "Medium High",
                'public customer_detail'[income] >= 70000, "High",
                "Unknown"
)
 


