-- Updated 18/04/2025 (v1.0.10)

TRUNCATE `salesforce_sync`.`sf_opportunity`;
ALTER TABLE `salesforce_sync`.`sf_opportunity` 
ADD COLUMN `APIM_ARR_Opportunity__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `IAM_BU_ARR_Opportunity__c`,
ADD COLUMN `Choreo_ARR_Opportunity__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Integration_BU_ARR_Opportunity__c`,
ADD COLUMN `APIM_PSO__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `IAM_PSO__c`,
ADD COLUMN `Choreo_PSO__c` DECIMAL(16,2) NULL DEFAULT '0.00' AFTER `Integration_PSO__c`;

