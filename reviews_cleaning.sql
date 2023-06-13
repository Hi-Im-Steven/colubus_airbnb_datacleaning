SELECT * FROM reviews

ALTER TABLE reviews
ALTER COLUMN id BIGINT;

--fixing a column name that has a space before it
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'reviews';

EXEC sp_rename 'reviews.[ listing_id]', 'listing_id', 'COLUMN';

ALTER TABLE reviews
ALTER COLUMN listing_id BIGINT;

ALTER TABLE reviews
ALTER COLUMN date DATE;
ALTER TABLE reviews
ALTER COLUMN reviewer_id BIGINT;

