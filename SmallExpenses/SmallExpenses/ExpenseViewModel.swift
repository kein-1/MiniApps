//
//  ExpenseViewModel.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/8/24.
//

import Foundation
import Observation

@Observable
class ExpenseViewModel {
    let expenseRepo: ExpenseRepository
    var expenses = [Expense]()
    init(expenseRepo: ExpenseRepository) {
        self.expenseRepo = expenseRepo
    }
}
