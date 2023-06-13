SELECT id, listing_url, name, availability_90 FROM listings 
SELECT id, listing_url, name, 90 - availability_90 AS booked_out_90, clean_price * (90 - availability_90) AS proj_rev_90 
FROM listings 
ORDER BY proj_rev_90 DESC;