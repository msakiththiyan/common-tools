-- Updated 18/06/2025 (v1.0.11)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Choreo_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Integration_Cloud_ARR__c`,
ADD COLUMN `APIM_Cloud_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Choreo_ARR__c`;
