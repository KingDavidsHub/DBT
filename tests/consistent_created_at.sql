SELECT
    l.created_at AS listing_created_at,
    r.listing_id
FROM
    {{ ref('fct_reviews') }} AS r
JOIN
    {{ ref('dim_listings_cleansed') }} AS l
ON
    r.listing_id = l.listing_id
WHERE
    r.review_date < l.created_at
LIMIT 10
