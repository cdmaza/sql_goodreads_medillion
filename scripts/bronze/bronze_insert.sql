/*  
    Load data from CSV file into Bronze table
    EXEC bronze.load_[load_layer(load_bronze)]
*/
CREATE OR ALTER PROCEDURE bronze.load_layer AS 
BEGIN
    DECLARE @start_time DATETIME,  @end_time DATETIME;
    BEGIN TRY -- debugging procedure
        PRINT '=====================================';
        PRINT 'Loading bronze layer';
        PRINT '=====================================';
        SET @start_time = GETDATE(); 
        PRINT '-------------------------------------';
        PRINT 'Loading data into bronze.goodreads';

        PRINT '>> Truncate table bronze.goodreads';
        TRUNCATE TABLE bronze.goodreads; -- clear the table before load data

        PRINT '>> Insert data into bronze.goodreads';
        BULK INSERT bronze.goodreads
        FROM 'C:\data\bronze\goodreads.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Data loaded in ' + CAST(DATEDIFF(SECOND, @first_time, @end_time) AS NVARCHAR(10)) + ' seconds';

    END TRY
    BEGIN CATCH
        PRINT 'An error occurred. Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(5)) + ' Error Message: ' + ERROR_MESSAGE();
    END CATCH
END 