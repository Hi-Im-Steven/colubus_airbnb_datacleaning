SELECT * FROM listings

ALTER TABLE listings
ALTER COLUMN id BIGINT;
ALTER TABLE listings
ALTER COLUMN host_id INT;
ALTER TABLE listings
ALTER COLUMN host_since DATE;
ALTER TABLE listings
ALTER COLUMN host_listings_count SMALLINT;
ALTER TABLE listings
ALTER COLUMN host_total_listings_count SMALLINT;
ALTER TABLE listings
ALTER COLUMN latitude DECIMAL(9, 6);
ALTER TABLE listings
ALTER COLUMN longitude DECIMAL(9, 6);
ALTER TABLE listings
ALTER COLUMN [Zip Code] INT;
ALTER TABLE listings
ALTER COLUMN accommodates SMALLINT;
ALTER TABLE listings
ALTER COLUMN bedrooms SMALLINT;
ALTER TABLE listings
ALTER COLUMN beds SMALLINT;

--cleaning values in minimum_nights such as '270.00' and '270.00"'
SELECT minimum_nights
FROM listings
WHERE TRY_CAST(minimum_nights AS INT) IS NULL;

UPDATE listings
SET minimum_nights = REPLACE(minimum_nights, '.', '')
WHERE TRY_CAST(minimum_nights AS INT) IS NULL;

UPDATE listings
SET minimum_nights = REPLACE(minimum_nights, '"', '')
WHERE TRY_CAST(minimum_nights AS INT) IS NULL;

ALTER TABLE listings
ALTER COLUMN minimum_nights SMALLINT;
ALTER TABLE listings
ALTER COLUMN maximum_nights SMALLINT;
ALTER TABLE listings
ALTER COLUMN minimum_minimum_nights SMALLINT;
ALTER TABLE listings
ALTER COLUMN maximum_minimum_nights SMALLINT;
ALTER TABLE listings
ALTER COLUMN minimum_maximum_nights SMALLINT;
ALTER TABLE listings
ALTER COLUMN maximum_maximum_nights INT;
ALTER TABLE listings
ALTER COLUMN minimum_nights_avg_ntm FLOAT(23);
ALTER TABLE listings
ALTER COLUMN maximum_nights_avg_ntm FLOAT(23);

--changing 't' and 'f' values (only 3 total) to t = 30 and f = 0
SELECT availability_30
FROM listings
WHERE TRY_CAST(availability_30 AS INT) IS NULL;

UPDATE listings 
SET availability_30 = REPLACE(availability_30, 'f', '0')
WHERE TRY_CAST(availability_30 AS INT) IS NULL;

UPDATE listings 
SET availability_30 = NULL
WHERE availability_30 LIKE 't';

ALTER TABLE listings
ALTER COLUMN availability_30 SMALLINT;

ALTER TABLE listings
ALTER COLUMN availability_60 SMALLINT;
ALTER TABLE listings
ALTER COLUMN availability_90 SMALLINT;
ALTER TABLE listings
ALTER COLUMN availability_365 SMALLINT;

--Cleaning values in number_of_reviews that showed up as a date (only 3)
SELECT number_of_reviews
FROM listings
WHERE TRY_CAST(number_of_reviews AS INT) IS NULL;

UPDATE listings
SET number_of_reviews = NULL
WHERE number_of_reviews = '3/28/2023';

ALTER TABLE listings
ALTER COLUMN number_of_reviews SMALLINT;
ALTER TABLE listings
ALTER COLUMN number_of_reviews_ltm SMALLINT;

--cleaning values in first_review that showed up as a 0 or 1 (only 3)
SELECT first_review
FROM listings
WHERE TRY_CAST(first_review AS DATE) IS NULL;

UPDATE listings
SET first_review = NULL
WHERE first_review LIKE '0' OR first_review LIKE '1';

ALTER TABLE listings
ALTER COLUMN first_review DATE;
ALTER TABLE listings
ALTER COLUMN last_review DATE;

SELECT review_scores_rating
FROM listings
WHERE TRY_CAST(review_scores_rating AS FLOAT) IS NULL;

UPDATE listings
SET review_scores_rating = NULL
WHERE review_scores_rating LIKE '%2023%';

ALTER TABLE listings
ALTER COLUMN review_scores_rating FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_accuracy FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_cleanliness FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_checkin FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_communication FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_location FLOAT(23);
ALTER TABLE listings
ALTER COLUMN review_scores_value FLOAT(23);

--cleaning values that show up as 'f' or 't' when they should be INT (3 total)
SELECT calculated_host_listings_count
FROM listings
WHERE TRY_CAST(calculated_host_listings_count AS INT) IS NULL;

UPDATE listings
SET calculated_host_listings_count = NULL
WHERE calculated_host_listings_count LIKE 't' OR calculated_host_listings_count LIKE 'f'

ALTER TABLE listings
ALTER COLUMN calculated_host_listings_count SMALLINT;

ALTER TABLE listings
ALTER COLUMN calculated_host_listings_count_entire_homes SMALLINT;
ALTER TABLE listings
ALTER COLUMN calculated_host_listings_count_private_rooms SMALLINT;
ALTER TABLE listings
ALTER COLUMN calculated_host_listings_count_shared_rooms SMALLINT;

--cleaning values that had ',' instead of '.' (3 total)
SELECT reviews_per_month
FROM listings
WHERE TRY_CAST(reviews_per_month AS FLOAT) IS NULL;

UPDATE listings
SET reviews_per_month = REPLACE(reviews_per_month, ',', '.')
WHERE TRY_CAST(reviews_per_month AS FLOAT) IS NULL;

UPDATE listings
SET reviews_per_month = NULL
WHERE reviews_per_month = '0.1.33'

ALTER TABLE listings
ALTER COLUMN reviews_per_month FLOAT(23);




