-- Updated 29/01/2024 (v1.0.6)

TRUNCATE `salesforce_sync`.`sf_account`;
ALTER TABLE `salesforce_sync`.`sf_account` 
ADD COLUMN `ShippingCountry` varchar(100) DEFAULT NULL AFTER `BillingCountry`;
