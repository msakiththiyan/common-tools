-- Updated 20/03/2024 (v1.0.7)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `Subscription_Start_Date__c` date DEFAULT NULL AFTER `PS_End_Date_Roll_Up__c`,
ADD COLUMN `Subscription_End_Date__c` date DEFAULT NULL AFTER `Subscription_Start_Date__c`;
