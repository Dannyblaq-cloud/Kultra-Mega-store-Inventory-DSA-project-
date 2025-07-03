CREATE database `DSA PROJECT`;
USE `DSA PROJECT`;
SELECT *
FROM `kms sql case study`;

-- CASE SCENAIRO 1 -- 
-- QUESTION 1--
SELECT`product category`, SUM(sales) AS Total_sale
FROM `kms sql case study`
GROUP BY `Product category`
ORDER BY Total_sale DESC;
-- QUESTION TWO--
-- top 3 region--
SELECT Region, sum(sales) AS Total_sale
FROM `kms sql case study`
GROUP BY Region 
ORDER BY Total_sale DESC
LIMIT 3;
-- QUESTION 2(B)
-- Buttom 3
-- top 3 region--
SELECT Region, sum(sales) AS Total_sale
FROM `kms sql case study`
GROUP BY Region 
ORDER BY Total_sale ASC
LIMIT 3;
-- QUESTION THREE
SELECT SUM(sales) AS Total_sale
FROM `kms sql case study`
WHERE `Product category` = 'Appliance'
    AND Region = 'Ontario';

-- QUESTION 4 
SELECT Sales, `customer name`, profit
FROM `kms sql case study`;
SELECT `Customer name`, SUM(Sales) AS `Total revenue`
FROM `kms sql case study`
GROUP BY `Customer name`
ORDER BY `Total revenue` ASC
LIMIT 10;
-- HERE ARE THE ADVICE 
-- 1. REACH OUT TO THESE CUSTOMERS DIRECTLY (VIA EMAIL OR PHONE NUMBER TO UNDERSTAND THEIR NEEDS OR DISSATISFACTION
-- 2. ASSIGN ACCOUNT MANAGERS OR USE CRM TOOLS TO PERSONALIZE FOLLOW UP AND IMPROVE SERVICE EXPERIENCE
-- 3. PROVIDE DISCOUNTS LOYALTY POINTS, OR "BUY ONE GET OME" OFFERS BASED ON THEIR PREVIOUS PURCHASE 
-- 4. RUN A TARGET CAMPAIGNS TO RE-ENGAGE THEM 
-- 5. RECOMMEND RELATED OR HIGHER-END PRODUCTS BASED ON THEIR LAST PURCHASE
-- 6. REMOVE FRICTION IN THEIR BUYING JOURNEY
-- AND FINAL, MANAGEMENT SHOULD TREAT THESE CUSTOMERS NOT AS UNPROFITABLE, BUT AS UNDER-TAPPED OPPORTUNITIES. 
-- PERSONALIZED ATTENTION, TARGETED OFFERS, AND RELATIONSHIP-BUILDING EFFORTS CAN CONVERT THEM INTO MORE VALUABLE CUSTOMERS OVER TIME
-- QUESTION 5
SELECT `ship mode`, SUM(`shipping cost`) AS `Total shipping cost`, `ship date`
FROM `kms sql case study`
GROUP BY `ship mode`, `ship date`
ORDER BY `Total shipping cost` DESC
LIMIT 1;
-- DELIVERY TRUCK IS THE MOST SHIP MODE KSM USED IN INCURRING THE MOST SHIPPING COST
-- QUESTION 6
SELECT `Customer name`, SUM(Sales) AS `Total sales`
FROM `kms sql case study`
GROUP BY `Customer name`
ORDER BY `Total sales`DESC
LIMIT 10;
-- WHAT DO THEY PURCHASE?
SELECT `Customer name`, `product name`, COUNT(*) AS times_bought, SUM(Sales) AS Total_sales
FROM `kms sql case study`
GROUP BY `Customer name`, `Product name`
ORDER BY Total_sales DESC
LIMIT 10;

-- QUESTION 7

SELECT *
FROM `kms sql case study`;
SELECT `Customer name`, `Customer segment`, SUM(Sales) AS Total_sales
FROM `kms sql case study`
WHERE `Customer segment` = 'Small business'
GROUP BY `Customer name`, `Customer segment`
ORDER BY Total_sales DESC
LIMIT 1;

-- QUESTION 8
SELECT STR_TO_DATE(`Order date`, '%d/%m/%Y')
FROM `kms sql case study`;
UPDATE `kms sql case study`
SET `Order date` = STR_TO_DATE(`Order date`, '%d/%m/%Y');
SELECT `Customer name`,`Customer segment`, COUNT(*) AS Total_order
FROM `kms sql case study`
WHERE `Customer segment` = 'Corporate'
      AND YEAR (`Order Date`) BETWEEN 2009 AND 2012
GROUP BY `Customer name`, `Customer segment`
ORDER BY Total_order DESC
;

SELECT `Customer name`,`Customer segment`, COUNT(*) AS Total_order
FROM `kms sql case study`
WHERE `Customer segment` = 'Corporate'
      AND  `Order Date` BETWEEN 2009-01-01 AND 2012-12-31
GROUP BY `Customer name`, `Customer segment`
ORDER BY Total_order DESC
LIMIT 1;
-- COMING BACK TO THIS
-- QUESTION 9

SELECT `Customer name`,`Customer segment`, SUM(Profit) AS Total_profit
FROM `kms sql case study`
WHERE `Customer segment` = 'Consumer'
GROUP BY `Customer name`, `Customer segment`
ORDER BY Total_profit DESC
LIMIT 1;
-- QUESTION 10
SELECT *
FROM `kms sql case study`;
SELECT `Customer name`, `Customer segment`, COUNT(*) AS Return_count
FROM `kms sql case study`
WHERE Profit < 0
GROUP BY `Customer name`, `Customer segment`
ORDER BY Return_count DESC
LIMIT 20;
-- QUESTION 11
SELECT `Order priority`, `Ship mode`, COUNT(*) AS Order_count,SUM(`Shipping cost`) AS Total_shipping_cost
FROM `kms sql case study`
GROUP BY `Order priority`, `Ship mode`
ORDER BY `Order priority`, Total_shipping_cost DESC;