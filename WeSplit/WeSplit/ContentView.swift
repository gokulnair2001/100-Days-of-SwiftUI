//
//  ContentView.swift
//  WeSplit
//
//  Created by Gokul Nair on 28/06/21.
//

import SwiftUI

struct ContentView: View {
  
    @State private var checkAmount = ""
    @State private var totalPeople = 2
    @State private var totalTip = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson:Double {
        let peopleCount = Double(totalPeople+2) // +2 : since the list provides index value
        let tipSelection = Double(tipPercentages[totalTip])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = (orderAmount / 100) * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $totalPeople){
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section(header: Text("How much Tip to leave?").bold()){
                    Picker("TIp Percentage", selection: $totalTip){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
