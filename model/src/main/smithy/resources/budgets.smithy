$version: "2"
namespace com.weekly.budgeter.resources

use com.weekly.budgeter.operation#DeleteBudget
use com.weekly.budgeter.operation#UpdateBudget
use com.weekly.budgeter.common#BudgetId
use com.weekly.budgeter.operation#CreateBudget
use com.weekly.budgeter.operation#ListBudgets
use com.weekly.budgeter.operation#DescribeBudget

resource BudgetResource {
    identifiers: { budgetId: BudgetId },
    create: CreateBudget,
    update: UpdateBudget,
    delete: DeleteBudget,
    list: ListBudgets,
    operations: [
        DescribeBudget
    ]
}