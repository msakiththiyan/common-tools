-- Updated 27/08/2025 (v1.0.13)
TRUNCATE `salesforce_sync`.`sf_account`;
ALTER TABLE `salesforce_sync`.`sf_account` 
ADD COLUMN `ARR_Churn_Date__c` DATE NULL DEFAULT NULL AFTER `IsInSF`;
