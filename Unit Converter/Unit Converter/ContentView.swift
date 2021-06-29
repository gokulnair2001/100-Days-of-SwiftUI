//
//  ContentView.swift
//  Unit Converter
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature = ""
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    private var outputTemperature = ""
    
    let units = ["m", "km", "feet", "yards"]
    
    var outputResult: Float {
        let selectedOutputUnit = units[selectedOutputUnit]
        let selectedInputUnit = units[selectedInputUnit]
        let input = Float(inputTemperature) ?? 0
        var finalResult = Float()
        
        switch (selectedInputUnit, selectedOutputUnit) {
        case ("m","m"):
            finalResult = input
        case ("m","km"):
            finalResult = input/1000
        case ("m","feet"):
            finalResult = input * 3.28084
        case ("m","yards"):
            finalResult = input * 1.09361
        case ("km","m"):
            finalResult = input * 1000
        case ("km","km"):
            finalResult = input
        case ("km","feet"):
            finalResult = input * 3280.84
        case ("km","yards"):
            finalResult = input * 1093.61
        case ("feet","m"):
            finalResult = input * 0.3048
        case ("feet","km"):
            finalResult = input * 0.0003048
        case ("feet","feet"):
            finalResult = input
        case ("feet","yards"):
            finalResult = input * 0.333333
        case ("yards","m"):
            finalResult = input * 0.9144
        case ("yards","km"):
            finalResult = input * 0.0009144
        case ("yards","feet"):
            finalResult = input*3
        case ("yards","yards"):
            finalResult = input

        default:
            break
        }
        return finalResult
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter length \(units[selectedInputUnit])", text: $inputTemperature)
                    Picker("Select input unit", selection: $selectedInputUnit){
                        ForEach(0..<units.count){
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Selct output unit", selection: $selectedOutputUnit){
                        ForEach(0..<units.count){
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result").bold()){
                    Text("\(outputResult, specifier: "%.3f") \(units[selectedOutputUnit])")
                }
                
            }
            .navigationTitle("Measury")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
