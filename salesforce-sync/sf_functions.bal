// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.

import ballerina/http;
import ballerina/log;
import ballerinax/salesforce;

configurable string sfBaseUrl = ?;
configurable SalesforceAuthConf sfAuth = ?;

// Initialise Salesforce service client
@display {
    label: "Salesforce Connector",
    id: "salesforce-connector"
}
final salesforce:Client salesforceEP = check new ({
    baseUrl: sfBaseUrl,
    auth: {...sfAuth},
    timeout: 300.0,
    retryConfig: {
        count: 3,
        interval: 5.0,
        statusCodes: [http:STATUS_INTERNAL_SERVER_ERROR, http:STATUS_SERVICE_UNAVAILABLE]
    },
    httpVersion: http:HTTP_1_1,
    http1Settings: {
        keepAlive: http:KEEPALIVE_NEVER
    }
});

# Get Salesforce Account object records from Salesforce.
# 
# + syncConfig - Sync configuration containing the query string
# + return - Account records
function sfQueryAccount(SfSyncConf syncConfig) returns SFAccountSyncRecord[]|error {
    log:printDebug(string `Querying ${ACCOUNT} object on Salesforce...`);
    stream<SFAccountSyncRecord, error?>|error resultStream = check salesforceEP->query(syncConfig.soqlQuery);
    if resultStream is error {
        error err = resultStream;
        return handleSalesforceError(err);
    }

    SFAccountSyncRecord[] sfRecords =
        check from var result in resultStream
        select check result.cloneWithType();

    log:printDebug(string `SUCCESS: Received ${sfRecords.length()} records from Salesforce.`);
    return sfRecords;
}

# Get Salesforce Opportunity object records from Salesforce.
# 
# + syncConfig - Sync configuration containing the query string
# + return - Opportunity records
function sfQueryOpportunity(SfSyncConf syncConfig) returns SFOpportunitySyncRecord[]|error {
    log:printDebug(string `Querying ${OPPORTUNITY} object on Salesforce...`);
    stream<SFOpportunitySyncRecord, error?>|error resultStream = check salesforceEP->query(syncConfig.soqlQuery);
    if resultStream is error {
        error err = resultStream;
        return handleSalesforceError(err);
    }

    SFOpportunitySyncRecord[] sfRecords =
        check from var result in resultStream
        select check result.cloneWithType();

    log:printDebug(string `SUCCESS: Received ${sfRecords.length()} records from Salesforce.`);
    return sfRecords;
}
