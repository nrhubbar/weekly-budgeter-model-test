$version: "2"
namespace com.weekly.budgeter

use aws.protocols#restJson1
use com.weekly.budgeter.resources#BudgetResource
use com.weekly.budgeter.resources#ExpenseResource

// TODO: Add additional Serivce Information as well as AuthN/Z Annotations

@title("A service to hanlde budgeting")
@restJson1
@documentation("Handles the storing and processing of budgets and expenses.")
service WeeklyBudgeter {
    version: "2023-07-08",
    resources: [
        BudgetResource,
        ExpenseResource,
    ]
}
