USE campusx2;

SELECT * FROM users;

# insert single row 

INSERT INTO campusx2.users (user_id , name, email, password) 
VALUES 
(NULL , "karan" , "karansh0411@gmail.com", "4545");

SELECT * FROM users;

# Insert multiple rows in a table 

INSERT INTO campusx2.users (user_id , name, email, password) 
VALUES 
(NULL , "krrish" , "krrish32gmail.com", "4433"),
(NULL , "Kunal" , "kunaldixit1106@mail.com", "9933"),
(NULL , "Himanshu" , "himanshu@gmail.com", "4433");

SELECT * FROM users;

# Query to select all ( print all dataset) 

SELECT * FROM campusx2.smartphones WHERE 1;

# Query to select particular column

SELECT model , price , rating from smartphones;

# Alias  = to remale a column title 

SELECT model , fast_charging as charging FROM smartphones;

SELECT * FROM smartphones;

# Find ppi value by using mathematical functions 

SELECT model , sqrt(resolution_width * resolution_width + resolution_height *  resolution_height)/screen_size as PPI from smartphones;

SELECT model , rating/10 FROM smartphones;

# constants 

SELECT model , "smartphone" AS "type" FROM smartphones;

# distinct value from a column 

SELECT DISTINCT(brand_name) FROM smartphones;

SELECT DISTINCT(processor_brand) AS all_processors FROM smartphones;

SELECT DISTINCT(os) FROM smartphones;

# distinct combinations 

SELECT DISTINCT brand_name , processor_brand FROM smartphones;

# Filter with where clause 

# find all phones whose brand is samsung
SELECT * FROM smartphones WHERE brand_name = "samsung";

# find all phones whose price is greater than 50000
SELECT * FROM smartphones WHERE price>50000;

# find all phones in the price range of 10000 and 20000
SELECT * FROM smartphones WHERE price BETWEEN 10000 AND 20000;

# find phones with rating  is greater than 80 and price below 25k
SELECT * FROM smartphones WHERE rating>80 AND price<25000;

# find all samsung phones with ram>8gb
SELECT * FROM smartphones WHERE brand_name = "samsung" AND ram_capacity>8;

# find all samsung phones with snapdragon processor 
SELECT * FROM smartphones WHERE brand_name = "samsung" AND processor_brand = "snapdragon";

# find brands who sell phones with price>100000
SELECT DISTINCT(brand_name)
 from smartphones WHERE price>100000;

# use of IN and NOT IN 

SELECT * FROM smartphones WHERE processor_brand IN ("snapdragon" , "exynos", "bionic");

SELECT * FROM smartphones WHERE processor_brand NOT IN ("snapdragon" , "exynos", "bionic");


# extract mediatek processor brand
SELECT DISTINCT(processor_brand) from smartphones;
SELECT * FROM smartphones WHERE processor_brand = "kirin";

select processor_brand , count(*) from smartphones  group by processor_brand;

UPDATE campusx2.smartphones SET processor_brand = "dimensity" WHERE processor_brand = "mediatek";

# find max and min price of phones from smartphones dataset 

SELECT MAX(price) FROM smartphones;

SELECT MIN(price) FROM smartphones;

SELECT MAX(price) FROM smartphones WHERE brand_name = "samsung";
SELECT * FROM smartphones WHERE brand_name = "samsung" and price = 110999;

select * from smartphones;

# find the number of oneplus phones

SELECT COUNT(*) FROM smartphones WHERE brand_name = "oneplus";

# count distinct of brandname 

SELECT COUNT(DISTINCT(brand_name)) FROM smartphones;

# standard deviation

SELECT STD(screen_size) FROM smartphones;

# variance 

SELECT VARIANCE(screen_size) FROM smartphones;

# CEIL  -> 

SELECT CEIL(processor_speed) FROM smartphones; 

# FLOOR 

SELECT FLOOR(processor_speed) FROM smartphones;

# Round 

SELECT ROUND(processor_speed) FROM smartphones;

