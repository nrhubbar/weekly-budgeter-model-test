$version: "2"
namespace com.weekly.budgeter.operation

use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.common#Expense
use com.weekly.budgeter.common#ExpenseAmountCents
use com.weekly.budgeter.common#ExpenseDate
use com.weekly.budgeter.common#ExpenseDescription
use com.weekly.budgeter.common#ExpenseId
use com.weekly.budgeter.common#ExpenseState

@documentation("Updates an existing expense.")
@http(method: "POST", uri: "/budgets/{budgetId}/expenses/{expenseId}")
operation UpdateExpense {
    input: UpdateExpenseRequest,
    output: UpdateExpenseResponse,
    errors: [] // TODO: Create Errors
}

@documentation("Input for updating a budget")
@input
structure UpdateExpenseRequest {

    @documentation("Id of the budget of the expense to update.")
    @httpLabel
    @required
    budgetId: BudgetId,

    @documentation("Id of the expense to update.")
    @httpLabel
    @required
    expenseId: ExpenseId,

     @required
    expenseDate: ExpenseDate,

    @required
    expenseDescription: ExpenseDescription,

    @required
    expenseAmoundCents: ExpenseAmountCents,

    @required
    expenseState: ExpenseState,
}

@documentation("The response from updating an expense")
@output
structure UpdateExpenseResponse {
    
    @documentation("Newly updated expense.")
    @required
    expense: Expense,
}
