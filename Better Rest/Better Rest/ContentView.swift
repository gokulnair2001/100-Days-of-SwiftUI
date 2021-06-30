//
//  ContentView.swift
//  Better Rest
//
//  Created by Gokul Nair on 30/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please select a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired AMount of sleep")
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                    Text("\(sleepAmount, specifier: "%g") hours")
                }.padding()
                
                Text("Daily Coffee intake")
                
                Stepper(value: $coffeeAmount, in: 1...20, step: 1){
                    if coffeeAmount == 1 {
                        Text("\(coffeeAmount) cup")
                    }else {
                        Text("\(coffeeAmount) cups")
                    }
                }.padding()
            }
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing: Button(action: calculateBedTime){
                Text("Calculate")
            })
        }
    }
    
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
