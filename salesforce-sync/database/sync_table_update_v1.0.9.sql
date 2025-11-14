-- Updated 16/07/2024 (v1.0.9)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `APIM_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `IAM_ARR__c`,
ADD COLUMN `APIM_Delayed_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `IAM_Delayed_ARR__c`;
