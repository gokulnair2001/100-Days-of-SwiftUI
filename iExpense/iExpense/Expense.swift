//
//  Expense.swift
//  iExpense
//
//  Created by Gokul Nair on 29/11/21.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItems](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}
