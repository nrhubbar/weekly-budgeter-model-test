$version: "2"
namespace com.weekly.budgeter

use aws.protocols#restJson1
use aws.apigateway#integration
use aws.apigateway#requestValidator
use aws.apigateway#authorizer
use aws.apigateway#authorizers
use aws.api#service
use aws.apigateway#apiKeySource
use aws.auth#cognitoUserPools

use com.weekly.budgeter.resources#BudgetResource
use com.weekly.budgeter.resources#ExpenseResource

// TODO: Add additional Serivce Information as well as AuthN/Z Annotations

@documentation("Handles the storing and processing of budgets and expenses.")
@title("A service to hanlde budgeting")
@service(
    sdkId: "WeeklyBudgeter",
)
@authorizers(
    // Cognito authorizer for user authentication
    "cognito-authorizer": {
        scheme: "aws.auth#cognitoUserPools",
    }
)
@cognitoUserPools(providerArns: ["REPLACE_WITH_COGNITO_USER_POOL_IMPORT_CDK"])
@authorizer("cognito-authorizer")
@apiKeySource("HEADER")
//@integration(
//    type: "http_proxy",
//    connectionType: "VPC_LINK",
//    uri: "http://host.name.replaced.in.cdk",
//    connectionId: "VpcLinkIdPlaceholder",
//    httpMethod: "HTTP_METHOD_REPLACED_IN_CDK",
//)
@integration(
    type: "aws_proxy",
    httpMethod: "POST",
    uri: "REPLACE_WITH_API_GATEWAY_LAMBDA_HANDLER_ARNS",
)
@restJson1
@requestValidator("full")
service WeeklyBudgeter {
    version: "2023-07-08",
    resources: [
        BudgetResource,
        ExpenseResource,
    ]
}
