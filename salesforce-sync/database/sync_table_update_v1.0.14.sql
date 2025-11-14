-- Updated 25/09/2025 (v1.0.14)
TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Opportunity_Record_Type` VARCHAR(100) NULL DEFAULT NULL AFTER `Renewal_Delayed__c`;