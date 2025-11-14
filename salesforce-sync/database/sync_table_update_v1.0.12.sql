-- Updated 05/08/2025 (v1.0.12)
TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Subs_Start_Date__c` DATE NULL DEFAULT NULL AFTER `Subscription_End_Date__c`,
ADD COLUMN `Subs_End_Date__c` DATE NULL DEFAULT NULL AFTER `Subs_Start_Date__c`,
ADD COLUMN `ARR_Cloud_ARR__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `Subs_End_Date__c`,
ADD COLUMN `IAM_ARR_AND_Cloud__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `ARR_Cloud_ARR__c`,
ADD COLUMN `APIM_ARR_Cloud__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `IAM_ARR_AND_Cloud__c`,
ADD COLUMN `Integration_ARR_AND_Cloud__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `APIM_ARR_Cloud__c`,
ADD COLUMN `Direct_Channel__c` VARCHAR(100) NULL DEFAULT NULL AFTER `Integration_ARR_AND_Cloud__c`,
ADD COLUMN `Forecast_Type1__c` VARCHAR(100) NULL DEFAULT NULL AFTER `Direct_Channel__c`;
