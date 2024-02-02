//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Andrew Park on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 2
    
    @FocusState private var amountIsFocused: Bool
    
    let temperatureUnits: [UnitTemperature] = [.fahrenheit, .celsius, .kelvin]
    
    var outputValue: Double {
            // Remember, we set inputValue = "", so we can see "Enter Value" placeholder in TextField
            guard let inputValue = Double(inputValue) else { return 0 } // convert to Double or exit immediately
            let inputUnit = temperatureUnits[inputUnitIndex]
            let outputUnit = temperatureUnits[outputUnitIndex]
            let measurement = Measurement(value: inputValue, unit: inputUnit)
            
            return measurement.converted(to: outputUnit).value
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter Value ", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Convert From:", selection: $inputUnitIndex) {
                        ForEach(0...2, id: \.self) {
                            Text(temperatureUnits[$0].symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Convert To:") {
                    Picker("Convert To:", selection: $outputUnitIndex) {
                        ForEach(0...2, id: \.self) {
                            Text(temperatureUnits[$0].symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Value:") {
                    Text("\(outputValue, specifier: "%.2f") \(temperatureUnits[outputUnitIndex].symbol)")

                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
