-- Updated 29/05/2024 (v1.0.8)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Add_to_Forecast__c` tinyint(4) NOT NULL DEFAULT '0' AFTER `Subscription_End_Date__c`;
