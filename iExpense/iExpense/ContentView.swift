//
//  ContentView.swift
//  iExpense
//
//  Created by Gokul Nair on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                            Spacer(minLength: 3)
                            Text(item.items)
                                .font(.caption)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "INR"))
                            .bold()
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar{
                ToolbarItem{
                    Button{
                        showingAddExpense = true
                    }label:{
                        Image(systemName: "plus")
                    }
                }
            }
        }.sheet(isPresented: $showingAddExpense){
            AddView(expenses: expenses)
        }
    }
    
    func removeItem(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
