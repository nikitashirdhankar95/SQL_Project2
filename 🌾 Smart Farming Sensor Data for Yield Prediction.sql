create database farming;
use  farming;

CREATE TABLE smart_farming_crop_yield (
    farm_id VARCHAR(20),
    region VARCHAR(50),
    crop_type VARCHAR(50),
    soil_moisture_percent DECIMAL(5,2),
    soil_pH DECIMAL(4,2),
    temperature_c DECIMAL(5,2),
    rainfall_mm DECIMAL(6,2),
    humidity_percent DECIMAL(5,2),
    sunlight_hours DECIMAL(4,2),
    irrigation_type VARCHAR(50),
    fertilizer_type VARCHAR(50),
    pesticide_usage_ml DECIMAL(6,2),
    sowing_date DATE,
    harvest_date DATE,
    total_days INT,
    yield_kg_per_hectare DECIMAL(8,2),
    sensor_id VARCHAR(20),
    timestamp DATETIME,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    NDVI_index DECIMAL(4,2),
    crop_disease_status VARCHAR(20)
);

select * from smart_farming_crop_yield;

# Q.1 What are the most common crop types in the dataset?
SELECT 
    crop_type, 
    COUNT(*) AS crop_count
FROM 
    smart_farming_crop_yield
GROUP BY 
    crop_type
ORDER BY 
    crop_count DESC;
    
# Q.2 What is the average crop yield across all farms?
SELECT AVG(yield_kg_per_hectare) AS average_crop_yield
FROM Smart_Farming_Crop_Yield;

# Q.3 Which regions have the highest and lowest average yields?
SELECT 
    region, 
    AVG(yield_kg_per_hectare) AS average_yield
FROM 
    Smart_Farming_Crop_Yield
GROUP BY 
    region
ORDER BY 
    average_yield DESC;

# Q.4 What is the average temperature, rainfall, and humidity during the growing period?
SELECT 
    AVG(temperature_c) AS average_temperature, 
    AVG(rainfall_mm) AS average_rainfall, 
    AVG(humidity_percent) AS average_humidity
FROM 
    smart_farming_crop_yield;

# Q.5 How many farms use each type of irrigation method?
SELECT 
    irrigation_type, 
    COUNT(farm_id) AS number_of_farms
FROM 
    smart_farming_crop_yield
GROUP BY 
    irrigation_type;

# Q.6 What is the most commonly used fertilizer type?
SELECT 
    fertilizer_type, 
    COUNT(*) AS usage_count
FROM 
    smart_farming_crop_yield
GROUP BY 
    fertilizer_type
ORDER BY 
    usage_count DESC
LIMIT 1;

# Q.7 What is the average number of days between sowing and harvest?
SELECT 
    AVG(total_days) AS average_days_between_sowing_and_harvest
FROM 
    smart_farming_crop_yield;

# Q.8 How many crops are affected by disease (None, Mild, Severe)?
SELECT 
    crop_disease_status, 
    COUNT(*) AS count_of_crops
FROM 
    smart_farming_crop_yield
GROUP BY 
    crop_disease_status;
    
# Q.9 What is the average NDVI index (vegetation health) for all crops?
SELECT 
    AVG(NDVI_index) AS average_ndvi_index
FROM 
    smart_farming_crop_yield;

# Q.10 Which crop type has the highest average yield?
SELECT 
    crop_type, 
    AVG(yield_kg_per_hectare) AS average_yield
FROM 
    smart_farming_crop_yield
GROUP BY 
    crop_type
ORDER BY 
    average_yield DESC
LIMIT 1;








