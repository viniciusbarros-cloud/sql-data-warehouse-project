/*
===================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===================================================================================
*/



EXEC bronze.load_bronze

--Bronze Layer Build Stored Procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
			PRINT '=================================================';
			PRINT 'Loading Bronze Layer'
			PRINT '=================================================';

			PRINT '-------------------------------------------------';
			PRINT 'Loading CRM tables';
			PRINT '-------------------------------------------------';

			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> bronze.crm_cust_info';
			TRUNCATE TABLE bronze.crm_cust_info

			PRINT 'Inserting data into Table:bronze.crm_cust_info';
				--Bronze Layer | Load Scripts 
			BULK INSERT bronze.crm_cust_info
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';

			/* ALWAYS CHECK the quality and the integrity of data, 
			i.e. are the informations inserted into the columns correct? */
			--SELECT COUNT(*) FROM bronze.crm_cust_info

			/* In case you've inserted files twice, you got to delete it using truncate table */

			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> bronze.crm_prd_info';
			TRUNCATE TABLE bronze.crm_prd_info

			PRINT 'Inserting data into Table:bronze.crm_prd_info';
			--bronze.crm_prd_info
			BULK INSERT bronze.crm_prd_info
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';
			--sales_details
			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> crm_sales_details';
			TRUNCATE TABLE bronze.crm_sales_details

			PRINT 'Inserting data into Table:crm_sales_details';

			BULK INSERT bronze.crm_sales_details
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';


			PRINT '-------------------------------------------------';
			PRINT 'Loading ERP tables';
			PRINT '-------------------------------------------------';


			--Files from erp
			--CUST_AZ12
			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> bronze.erp_cust_az12';
			TRUNCATE TABLE bronze.erp_cust_az12

			PRINT 'Inserting data into Table:bronze.erp_cust_az12';

			BULK INSERT bronze.erp_cust_az12
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';
			--LOC_A101
			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> bronze.erp_loc_a101';
			TRUNCATE TABLE bronze.erp_loc_a101

			PRINT 'Inserting data into Table:bronze.erp_loc_a101';

			BULK INSERT bronze.erp_loc_a101
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';

			--PX_CAT_G1V2
			SET @start_time = GETDATE();
			PRINT 'Truncating Table >> bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE bronze.erp_px_cat_g1v2

			PRINT 'Inserting data into Table:bronze.erp_px_cat_g1v2';

			BULK INSERT bronze.erp_px_cat_g1v2
			--After FROM, insert the FILENAME of the file
			FROM 'C:\Users\vinic\OneDrive\Área de Trabalho\ANALYTICS ENGINEERING\The Complete SQL Bootcamp\Seção 24 Data WareHousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
			WITH (
			-- Since the firstrow is the table name, we must skip it.
			FIRSTROW = 2,
			--Now,specify the delimiter , ;,| # "
			FIELDTERMINATOR = ',',
			TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Loading Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
			PRINT '---------------------';


			SET @batch_end_time = GETDATE();
		PRINT '===============================================';
		PRINT'Load of Bronze Layer Completed'
		PRINT '>> Loading Bronze Layer Duration: '+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds.';
		PRINT '===============================================';


			END TRY
			BEGIN CATCH
			PRINT '=================================================';
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
			PRINT 'Error Message' + ERROR_MESSAGE();
			PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
			PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
			PRINT '=================================================';
			END CATCH
		
	END
