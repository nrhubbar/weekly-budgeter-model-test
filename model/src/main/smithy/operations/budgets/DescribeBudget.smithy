$version: "2"
namespace com.weekly.budgeter.operation

use com.weekly.budgeter.common#NextToken
use com.weekly.budgeter.common.error#AccessDeniedError
use com.weekly.budgeter.common.error#InternalServerError
use com.weekly.budgeter.common.error#ResourceNotFoundError
use com.weekly.budgeter.common.error#ThrottlingError
use com.weekly.budgeter.common.error#ValidationError
use com.weekly.budgeter.common#MaxResults
use com.weekly.budgeter.common#Budget
use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.common#Expenses


@documentation("Gets the data on a budget, and returns a paginated list of Expenses.")
@http(method: "GET", uri: "/budgets/{budgetId}")
@paginated(
    inputToken: "nextToken", 
    outputToken: "nextToken",
    pageSize: "maxResults", 
    items: "expenses"
)
@readonly
operation DescribeBudget {
    input: DescribeBudgetRequest,
    output: DescribeBudgetResponse,
    errors: [
        ValidationError,
        AccessDeniedError,
        ResourceNotFoundError,
        ThrottlingError,
        InternalServerError,
    ],
}

@input
structure DescribeBudgetRequest {

    @required
    @httpLabel
    budgetId: BudgetId,

    @documentation("""
        Starting timestamp of range to grab expenses within. If provided 'endDate' MUST also be provided.
        If not provided, will query all available expenses in budget.
    """)
    @httpQuery("startDate")
    startDate: Timestamp,

    @documentation("""
        End timestamp of range to grab expenses within. If provided 'startDate' MUST also be provided.
        If not provided, will query all available expenses in budget.
    """)
    @httpQuery("endDate")
    endDate: Timestamp,

    @httpQuery("maxResults")
    maxResults: MaxResults,

    @httpQuery("nextToken")
    nextToken: NextToken,

}

@output
structure DescribeBudgetResponse {

    nextToken: NextToken,

    @required
    budget: Budget,

    @required
    @length(min: 0, max: 100)
    expenses: Expenses,
}