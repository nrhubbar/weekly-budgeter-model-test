$version: "2"
namespace com.weekly.budgeter.operation

use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.common.error#AccessDeniedError
use com.weekly.budgeter.common.error#InternalServerError
use com.weekly.budgeter.common.error#ResourceNotFoundError
use com.weekly.budgeter.common.error#ThrottlingError
use com.weekly.budgeter.common.error#ValidationError

@documentation("Creates a new budget.")
@idempotent
@http(method: "DELETE", uri: "/budgets/{budgetId}")
operation DeleteBudget {
    input: DeleteBudgetRequest,
    output: DeleteBudgetResponse,
    errors: [
        ValidationError,
        AccessDeniedError,
        ResourceNotFoundError,
        ThrottlingError,
        InternalServerError,
    ]
}

@documentation("Input for creating a new budget")
@input
structure DeleteBudgetRequest {

    @documentation("Id of the budget to delete.")
    @httpLabel
    @required
    budgetId: BudgetId,
}

@documentation("The response from deleting a budget")
@output
structure DeleteBudgetResponse {
}
