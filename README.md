# Local Medillion Architecture

This project just to demonstrate implementation of medillion arhitecture on local MSSQL server. Data given taken from kaggle to explore the data knowledge.

**Project aim:**
- Performance data integestion, transformation and aggregation to perform 3 medillion layer. 

## Arhitecture Design

![Architecture Desgin](img/pipeline.jpg)

## Tools
- Data: [GoodReads Book](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks)
- Database: MSSQL Server

### Arhitecture flow

#### Bronze Layer
Load into MSSQL Server:

1. Build table

    ```bash
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
    ```
2. Load data into table:

    - Bulk insert
    ```bash
    BULK INSERT bronze.goodreads
        FROM '.csv'
        WITH (
            FIRSTROW = 2, 
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK 
        );
    ```

    **Output:**
    Status (Progress)

    ![Output](img/table.jpg)

#### Silver Layer
Cleaning & Transformation

1. Build table

    ```bash
    CREATE TABLE silver.goodreads (
        bookID INT,
        title NVARCHAR(255),
        ...
        dwh_created_at DATETIME2 DEFAULT GETDATE()
    );
    ```
    Additional column to records load timestamp: **dwh_created_at**
    ****
2. Cleaning & Transformation:

    ```bash
    BULK INSERT bronze.goodreads
        FROM '.csv'
        WITH (
            FIRSTROW = 2, 
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK 
        );
    ```

**Output:**
Status (Progress)

![Output](img/table.jpg)


**Context**
