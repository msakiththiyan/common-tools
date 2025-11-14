ALTER TABLE `salesforce_sync`.`sf_account` 
CHANGE COLUMN `Name` `Name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL ,
CHANGE COLUMN `Account_Owner_Email` `Account_Owner_Email` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `Account_Owner_FullName` `Account_Owner_FullName` VARCHAR(100) NOT NULL ;

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `CloseDate` DATE NOT NULL AFTER `AccountId`,
ADD COLUMN `Cloud_ARR_Opportunity__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `OB_Delayed_ARR__c`,
ADD COLUMN `IAM_BU_ARR_Opportunity__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `Cloud_ARR_Opportunity__c`,
ADD COLUMN `Integration_BU_ARR_Opportunity__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `IAM_BU_ARR_Opportunity__c`,
ADD COLUMN `IAM_PSO__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `Integration_BU_ARR_Opportunity__c`,
ADD COLUMN `Integration_PSO__c` DECIMAL(16,2) NULL DEFAULT 0.00 AFTER `IAM_PSO__c`,
CHANGE COLUMN `ARR__c` `ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `IAM_ARR__c` `IAM_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `Integration_ARR__c` `Integration_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `Open_Banking_ARR__c` `Open_Banking_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `Delayed_ARR__c` `Delayed_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `IAM_Delayed_ARR__c` `IAM_Delayed_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `Integration_Delayed__c` `Integration_Delayed__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `OB_Delayed_ARR__c` `OB_Delayed_ARR__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ,
CHANGE COLUMN `CL_ARR_Today__c` `CL_ARR_Today__c` DECIMAL(16,2) NOT NULL DEFAULT 0.00 ;
