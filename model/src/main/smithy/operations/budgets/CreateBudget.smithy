$version: "2"
namespace com.weekly.budgeter.operation

use com.weekly.budgeter.common#AllowedUsers
use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.common#BudgetName
use com.weekly.budgeter.common#WeeklyLimitCents
use com.weekly.budgeter.common.error#AccessDeniedError
use com.weekly.budgeter.common.error#InternalServerError
use com.weekly.budgeter.common.error#ResourceConflictError
use com.weekly.budgeter.common.error#ResourceLimitExceededError
use com.weekly.budgeter.common.error#ThrottlingError
use com.weekly.budgeter.common.error#ValidationError
use com.weekly.budgeter.common#ClientToken

@documentation("Creates a new budget.")
@idempotent
@http(method: "POST", uri: "/budgets")
operation CreateBudget {
    input: CreateBudgetRequest,
    output: CreateBudgetResponse,
    errors: [
        ValidationError,
        ResourceLimitExceededError,
        AccessDeniedError,
        ResourceConflictError,
        ThrottlingError,
        InternalServerError,
    ]
}

@documentation("Input for creating a new budget")
@input
structure CreateBudgetRequest {

    @documentation("Name of the new budget.")
    @required
    name: BudgetName,

    @documentation("Weekly spending limit.")
    @required
    limit: WeeklyLimitCents,

    @documentation("Users with access to this API")
    @required
    allowedUsers: AllowedUsers,

    @required
    @idempotencyToken
    clientToken: ClientToken,
}

@documentation("The response from creating a new budget")
@output
structure CreateBudgetResponse {
    
    @documentation("Name of the created budget.")
    @required
    name: BudgetName,

    @documentation("Id of the created budget.")
    @required
    id: BudgetId,
}
