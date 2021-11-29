//
//  ExpenseItems.swift
//  iExpense
//
//  Created by Gokul Nair on 29/11/21.
//

import Foundation

struct ExpenseItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let items: String
    let amount: Double
}
