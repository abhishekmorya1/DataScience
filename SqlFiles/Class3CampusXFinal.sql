use campusx2;
select * from smartphones;

# find top 5 samsung phones with biggest screen size

SELECT model, screen_size FROM smartphones WHERE brand_name = "samsung" ORDER BY screen_size DESC LIMIT 5;

# sort all the phone with in descending order of number of total cameras

SELECT model , num_rear_cameras + num_front_cameras AS  "total_Cameras" FROM smartphones ORDER BY   total_Cameras DESC;

# sort data on the basis of ppi in decreasing order 

SELECT model , sqrt(resolution_width * resolution_width + resolution_height *  resolution_height)/screen_size 
as PPI
from smartphones ORDER BY PPI DESC;

# find the phone with second largest battery 

select model , battery_capacity FROM smartphones ORDER BY battery_capacity DESC LIMIT 1,1;

select model , battery_capacity FROM smartphones ORDER BY battery_capacity DESC ;
# third highest
select model , battery_capacity FROM smartphones ORDER BY battery_capacity DESC LIMIT 2,1;

# second lowest 
select model , battery_capacity FROM smartphones ORDER BY battery_capacity ASC LIMIT 1,1;

# find the name and rating of the worst rated apple phone 

SELECT model , rating FROM smartphones WHERE brand_name = "apple" ORDER BY rating ASC limit 1; 

# sort phones alphabetically and then on the basis of rating in descending order 

SELECT * FROM smartphones ORDER BY brand_name ASC , rating  DESC;


# sort phones alphabetically and then on the basis of price in asceding order 
SELECT * FROM smartphones ORDER BY brand_name ASC , price  ASC;

# Group By 

#  Group smartphones by brand and get the count , average price, max rating, aveg screen size and avg battery capacity

SELECT brand_name , count(*) AS num_phones , avg(price) AS "Average Price", MAX(rating) , AVG(screen_size) , AVG(battery_capacity)
 FROM smartphones GROUP BY brand_name  ORDER BY num_phones DESC ;
 
 # Group smartphones by whether they have an NFC and get the average price and rating 
 
 SELECT has_nfc , AVG(price) , AVG(rating) FROM smartphones  GROUP BY has_nfc;
 
 # group smartphones by the extended memory available and get the average price 
 
 SELECT extended_memory_available , AVG(price) FROM smartphones GROUP BY extended_memory_available;
 
 # group smartphones by the brand and processor brand and get
 #the count of models and the average primary camera resolution(Rear)
 
 SELECT 
    brand_name,
    processor_brand,
    COUNT(*) AS model_count,
    AVG(primary_camera_rear) AS avg_camera
FROM smartphones
GROUP BY brand_name, processor_brand;

# find top 5 most costly phone brands 

SELECT brand_name , AVG(price) AS "AveragePrice"  FROM smartphones GROUP BY brand_name ORDER BY AveragePrice DESC limit 5;

# which brand makes the smallest screen smartphones 

SELECT brand_name , min(screen_size) as "MinScreenSize" from smartphones GROUP BY brand_name ORDER BY MinScreenSize ASC limit 1;
 
# Average price of 5g phones vs average price of non 5g phones 

SELECT has_5g  , AVG(price) FROM smartphones GROUP BY has_5g;

# group smartphones by the brand and find the brand with the highest number of models that have both nfc and an IR blaster

SELECT brand_name , count(*) as "ModelCount" FROM smartphones WHERE has_nfc = 'True' AND has_ir_blaster = 'True' GROUP BY brand_name ORDER BY ModelCount DESC LIMIT 1;

# find all samsung 5g enabled smartphones and find out the average price for  NFC and NON-NFC phones 

SELECT has_nfc , AVG(price) FROM smartphones WHERE brand_name = "samsung" AND has_5g = 'True' GROUP BY has_nfc;

# find the phone name , price of the costliest phone 

SELECT model , price FROM smartphones ORDER BY price DESC limit 1;


# use of having 

# find the average rating of smartphone brands which have more than 20 phones 

SELECT brand_name , COUNT(*)AS count , AVG(rating) AS avg_rating FROM smartphones GROUP BY brand_name HAVING count>20
 ORDER BY avg_rating DESC;
 
#Find the top 3 brands with the highest average RAM that have a refresh rate of at least 90 Hz and fast charging available, 
# and don't consider brands which have less than 10 phones.

SELECT brand_name , COUNT(*) AS count, AVG(ram_capacity) AS avg_ram FROM smartphones
WHERE refresh_rate >=90 AND fast_charging_available = "1"  GROUP BY brand_name HAVING count>=10
ORDER BY avg_ram DESC LIMIT 3;


#Find the average price of all the phone brands with an average rating > 70 and number of phones
#more than 10 among all 5G-enabled phones.
 
SELECT 
    brand_name,
    AVG(price) AS avg_price,
    AVG(rating) AS avg_rating,
    COUNT(*) AS count
FROM smartphones
WHERE has_5g = "True"
GROUP BY brand_name
HAVING AVG(rating) > 70
   AND COUNT(*) > 10;
   
DROP table ipl;

select * from ipl

