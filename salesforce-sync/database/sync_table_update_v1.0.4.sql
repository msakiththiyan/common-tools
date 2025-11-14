-- 30/11/2022 (v1.0.4)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `IAM_Cloud_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Integration_PSO__c`,
ADD COLUMN `Integration_Cloud_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `IAM_Cloud_ARR__c`;
