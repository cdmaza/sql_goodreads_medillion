IF OBJECT ID ('bronze.goodreads', 'U') IS NOT NULL
    DROP TABLE bronze.goodreads;
CREATE TABLE bronze.goodreads (
    bookID INT,
    title NVARCHAR(255),
    authors NVARCHAR(50),
    average_rating FLOAT,
    isbn INT,
    language_code NVARCHAR(50),
    num_pages INT,
    ratings_count INT,
    text_reviews_count INT,
    publication_date DATE,
    publisher NVARCHAR(50)
);
