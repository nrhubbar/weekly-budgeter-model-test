$version: "2"
namespace com.weekly.budgeter.operation

use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.common#ClientToken
use com.weekly.budgeter.common#ExpenseAmountCents
use com.weekly.budgeter.common#ExpenseDate
use com.weekly.budgeter.common#ExpenseId
use com.weekly.budgeter.common#ExpenseState
use com.weekly.budgeter.common.error#AccessDeniedError
use com.weekly.budgeter.common.error#InternalServerError
use com.weekly.budgeter.common.error#ResourceConflictError
use com.weekly.budgeter.common.error#ResourceLimitExceededError
use com.weekly.budgeter.common.error#ResourceNotFoundError
use com.weekly.budgeter.common.error#ThrottlingError
use com.weekly.budgeter.common.error#ValidationError
use com.weekly.budgeter.common#ExpenseDescription

@documentation("Creates a new expense.")
@idempotent
@http(method: "POST", uri: "/budgets/{budgetId}/expenses")
operation CreateExpense {
    input: CreateExpenseRequest,
    output: CreateExpenseResponse,
    errors: [
        ValidationError,
        ResourceLimitExceededError,
        AccessDeniedError,
        ResourceNotFoundError,
        ResourceConflictError,
        ThrottlingError,
        InternalServerError,
    ],
}

@documentation("Input for creating a new budget")
@input
structure CreateExpenseRequest {

    @documentation("Name of the new budget.")
    @required
    @httpLabel
    budgetId: BudgetId,

    @required
    expenseDate: ExpenseDate,

    @required
    expenseDescription: ExpenseDescription,

    @required
    expenseAmoundCents: ExpenseAmountCents,

    @required
    expenseState: ExpenseState,

    @required
    @idempotencyToken
    clientToken: ClientToken,
}

@documentation("The response from creating a new expense")
@output
structure CreateExpenseResponse {
    
    @documentation("Description of the new expense.")
    @required
    expenseDescription: ExpenseDescription,

    @documentation("Id of the created budget.")
    @required
    expenseId: ExpenseId,
}
