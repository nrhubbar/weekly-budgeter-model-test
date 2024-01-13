namespace com.weekly.budgeter

use com.weekly.budgeter#WeeklyBudgeter

apply WeeklyBudgeter @aws.apigateway#integration(
    type: "aws_proxy",
    httpMethod: "POST",
    uri: ""
)
