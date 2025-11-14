-- 26/01/2025 (v1.0.5)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Cloud_ARR__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Integration_PSO__c`;
