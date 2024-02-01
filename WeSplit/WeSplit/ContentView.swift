//
//  ContentView.swift
//  WeSplit
//
//  Created by Andrew Park on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    // State vars automatically watch out for changes/updates to views
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    // We need to give SwiftUI some way of determining whether the check amount box should currently have focus – should be receiving text input from the user.
    @FocusState private var amountIsFocused: Bool
    
    // Not everyone wants to pay same tip percentage
//    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Remember, this thing has the range 2 to 100, but it counts from 0, which is why we need to add the 2.
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalCheckAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Get user's locale, read out their currency code (if they have preference), fallback to USD with nil coalescing
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    // Clicking into another keyboard to get to numbers is extra step, decimalPad is easier for UX
                        .keyboardType(.decimalPad)
                    // should be receiving text input from the user
                        .focused($amountIsFocused)
                    

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<70) {
                            Text("\($0) people" )
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
//                      ForEach(tipPercentages, id: \.self) {
                        ForEach(1..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segment)
                }
            
                Section("Amount per person") {
                    // Replaced checkAmount with totalPerPerson
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Grand total") {
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            // The toolbar() modifier lets us specify toolbar items for a view. These toolbar items might appear in various places on the screen – in the navigation bar at the top, in a special toolbar area at the bottom, and so on.
            .toolbar {
                // Should only show button when textfield is active
                if amountIsFocused {
                    // displays some tappable content, keyboard dismissed after amountIsFocused turned false
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
