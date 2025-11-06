# Pizza Sales Analysis (SQL + Power BI)

This project analyzes a pizza store's sales data using **SQL Server** and visualizes the results in a **Power BI/Excel dashboard**.  
The goal is to understand revenue trends, customer ordering behavior, and best/worst selling pizzas.

---

## Project Objectives

- Calculate key business KPIs:
  - Total Revenue  
  - Average Order Value  
  - Total Pizzas Sold  
  - Total Orders  
  - Average Pizzas per Order
- Analyze:
  - Daily and Monthly trends for total orders  
  - % of sales by Pizza Category and Pizza Size  
  - Top 5 and Bottom 5 pizzas by:
    - Revenue  
    - Quantity  
    - Total Orders

---

## Tech Stack

- **Database:** SQL Server (`Pizza_DA` database, `pizza_sales` table)
- **Query Language:** T-SQL
- **Visualization:** Power BI / Excel Dashboard
- **File Types:** `.sql` scripts, `.pbix` or Excel file, and dashboard screenshots

---

## SQL Analysis

Main SQL queries included in this repo:

- Total Revenue  
- Average Order Value (`Total Revenue / distinct orders`)  
- Total Pizzas Sold (sum of quantity)  
- Average Pizzas per Order  
- Daily trend for total orders (by weekday)  
- Monthly trend for total orders  
- Percentage of sales by pizza category and size  
- Top 5 pizzas by revenue, quantity, and total orders  
- Bottom 5 pizzas by revenue, quantity, and total orders  

All queries are in:  
`/sql/pizza_sales_analysis.sql`

---

## Dashboard Features

**Home Page**

- KPI cards:
  - Total Revenue  
  - Average Order Value  
  - Total Pizzas Sold
- Daily trend bar chart (orders by weekday)
- Monthly trend line chart (orders by month)
- Donut charts:
  - % of Sales by Pizza Category  
  - % of Sales by Pizza Size
- Bar chart: Total Pizzas Sold by Pizza Category
- Insight cards:
  - Busiest days & times  
  - Best performing category and size

**Best/Worst Sellers Page**

- KPI cards:
  - Avg Order Value  
  - Total Pizzas Sold  
  - Total Orders
- Top 5 pizzas:
  - By Revenue  
  - By Quantity  
  - By Total Orders
- Bottom 5 pizzas:
  - By Revenue  
  - By Quantity  
  - By Total Orders
- Insight cards showing which pizzas contribute maximum/minimum revenue, quantities, and orders.

---

## How to Run

1. **Database Setup**
   - Create the database:
     ```sql
     CREATE DATABASE Pizza_DA;
     ```
   - Import the pizza sales dataset into a table named `pizza_sales`.
   - (Optional) If needed, rename:
     ```sql
     EXEC sp_rename 'dbo.[pizza_sales_excel_file.xlsx - pizza_sales]', 'pizza_sales';
     ```

2. **Run SQL Scripts**
   - Open `pizza_sales_analysis.sql` in SQL Server Management Studio.
   - Execute the queries to verify results and explore the data.

3. **Power BI / Excel Dashboard**
   - Open the `.pbix` or Excel dashboard file from `/dashboard`.
   - Refresh the connection to the `Pizza_DA` database.
   - Use slicers (date range, pizza category) to interact with the report.

---

## Key Insights (Example)

- Orders are highest on **weekends (Friday/Saturday evenings)**.
- **Classic** category and **Large** size contribute the maximum sales.
- Certain pizzas consistently appear in the **Top 5** and **Bottom 5**, helping identify what to promote and what to reconsider.

---

## Screenshots

Screenshots of the dashboard are in the `/images` folder:
- `home_page.png`
- `best_worst_sellers.png`

---

## Future Improvements

- Add customer-level analysis (repeat customers, cohort analysis).
- Include time-of-day analysis in more detail.
- Build additional DAX measures for deeper profitability insights.

