$version: "2"
namespace com.weekly.budgeter.resources

use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.operation#DeleteExpense
use com.weekly.budgeter.operation#UpdateExpense
use com.weekly.budgeter.common#ExpenseId
use com.weekly.budgeter.operation#CreateExpense

resource ExpenseResource {
    identifiers: { 
        budgetId: BudgetId ,
        expenseId: ExpenseId,
    },
    create: CreateExpense,
    update: UpdateExpense,
    delete: DeleteExpense,
}