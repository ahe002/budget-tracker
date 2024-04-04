//
//  ContentView.swift
//  budget-tracker
//
//  Created by A H on 3/28/24.
//

import SwiftUI

struct ContentView: View {
        @State private var currentValue = 0.0
        @State private var enteredValue = ""
        
        var body: some View {
            VStack {
                Text("Current Budget: \(currentValue, format: .number)")
                    .font(.title)
                HStack {
                    TextField("Enter an amount", text: $enteredValue)
                    
                    Spacer()
                    Button(action: {
                        if let value = Double(enteredValue) {
                            currentValue += value
                            enteredValue = ""
                        }
                    }) {
                        Text("Add Funds")
                            .foregroundColor(.green)
                    }
                    Button(action: {
                        if let value = Double(enteredValue) {
                            currentValue -= value
                            enteredValue = ""
                        }
                    }) {
                        Text("Pay Bill")
                            .foregroundColor(.red)
                    }
                }
            }
            
        }
    }

#Preview {
    ContentView()
  }
