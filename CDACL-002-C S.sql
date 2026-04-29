use project_shopping_trends;

select * from shopping_trends_dataset;

select count(*) from shopping_trends_dataset;

select count(distinct(Category)) from shopping_trends_dataset;

select distinct(location) from shopping_trends_dataset;

Alter table shopping_trends_dataset rename to std;

select count(*) from std;

select * from std;

SELECT 
    SUM(CASE WHEN `CustomerID` IS NULL THEN 1 ELSE 0 END) AS CustomerID_nulls,
    SUM(CASE WHEN `Age` IS NULL THEN 1 ELSE 0 END) AS Age_nulls,
    SUM(CASE WHEN `Gender` IS NULL THEN 1 ELSE 0 END) AS Gender_nulls,
    SUM(CASE WHEN `ItemPurchased` IS NULL THEN 1 ELSE 0 END) AS ItemPurchased_nulls,
    SUM(CASE WHEN `Category` IS NULL THEN 1 ELSE 0 END) AS Category_nulls,
    SUM(CASE WHEN `PurchaseAmountUSD` IS NULL THEN 1 ELSE 0 END) AS PurchaseAmount_nulls,
    SUM(CASE WHEN `Location` IS NULL THEN 1 ELSE 0 END) AS Location_nulls,
    SUM(CASE WHEN `Size` IS NULL THEN 1 ELSE 0 END) AS Size_nulls,
    SUM(CASE WHEN `Color` IS NULL THEN 1 ELSE 0 END) AS Color_nulls,
    SUM(CASE WHEN `Season` IS NULL THEN 1 ELSE 0 END) AS Season_nulls,
    SUM(CASE WHEN `ReviewRating` IS NULL THEN 1 ELSE 0 END) AS ReviewRating_nulls,
    SUM(CASE WHEN `SubscriptionStatus` IS NULL THEN 1 ELSE 0 END) AS SubscriptionStatus_nulls,
    SUM(CASE WHEN `ShippingType` IS NULL THEN 1 ELSE 0 END) AS ShippingType_nulls,
    SUM(CASE WHEN `DiscountApplied` IS NULL THEN 1 ELSE 0 END) AS DiscountApplied_nulls,
    SUM(CASE WHEN `PromoCodeUsed` IS NULL THEN 1 ELSE 0 END) AS PromoCodeUsed_nulls,
    SUM(CASE WHEN `PreviousPurchases` IS NULL THEN 1 ELSE 0 END) AS PreviousPurchases_nulls,
    SUM(CASE WHEN `PaymentMethod` IS NULL THEN 1 ELSE 0 END) AS PaymentMethod_nulls,
    SUM(CASE WHEN `FrequencyofPurchases` IS NULL THEN 1 ELSE 0 END) AS FrequencyOfPurchases_nulls
FROM std;

select distinct(age) from std where age>60;

select *,
	case
		when age < 20 then 'below 20'
        when age between 20 and 29 then '20s'
        when age between 30 and 39 then '30s'
		when age between 40 and 49 then '40s'
		when age between 50 and 59 then '50s'
        else '60+'
	end as 'Age_Group'
from std;
         
select * from std;

alter table std add column Age_Group Varchar(50);

update std
set age_group= case
					when age < 20 then 'below 20'
        when age between 20 and 29 then '20s'
        when age between 30 and 39 then '30s'
		when age between 40 and 49 then '40s'
		when age between 50 and 59 then '50s'
        else '60+'
	end;


select category, sum(PurchaseAmountUSD)
from std
group by category
order by sum(PurchaseAmountUSD) desc;

select Season, sum(PurchaseAmountUSD)
from std
group by season
order by sum(PurchaseAmountUSD) desc;

select location, sum(PurchaseAmountUSD)
from std
group by Location
order by sum(PurchaseAmountUSD) desc;

select age_group, paymentmethod
from std
group by age_group, paymentmethod;

select age_group, paymentmethod, sum(purchaseamountusd) as tot_amt
from std
group by age_group, paymentmethod
order by age_group, tot_amt desc;

select category, discountapplied
from std
group by category, discountapplied;

select  category, discountapplied, sum(purchaseamountusd) as tot_amt, count(*) as tot_count 
from std
group by category, discountapplied
order by category, discountapplied;

select * from std;