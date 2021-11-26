//
//  ContentView.swift
//  Better Rest
//
//  Created by Gokul Nair on 30/06/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMesg = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("When do you want to wake up?")){
                    DatePicker("Select wakeup time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
                }
                
                Section(header:  Text("Desired AMount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    
                }
                
                Section(header: Text("Daily Coffee intake")) {
                    Stepper(value: $coffeeAmount, in: 1...20, step: 1){
                        if coffeeAmount == 1 {
                            Text("\(coffeeAmount) cup")
                        }else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
            }
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing: Button(action: calculateBedTime){
                Text("Calculate")
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMesg), dismissButton: .default(Text("Ok")))
            })
        }
    }
    
    // Setting Default wakeUp time
    static var defaultWakeUpTime: Date {
        var dateComponent = DateComponents()
        dateComponent.hour = 7
        dateComponent.minute = 0
        return Calendar.current.date(from: dateComponent) ?? Date()
    }
    
    func calculateBedTime() {
        
        do {
            let config = MLModelConfiguration()
            let model = try sleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let min = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + min), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMesg = formatter.string(from: sleepTime)
            alertTitle = "Your sleep time is.."
            
        } catch  {
            alertTitle = "Error"
            alertMesg = "Sorry, some error occurred while calculating sleep time"
        }
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
