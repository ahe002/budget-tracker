//
//  ContentView.swift
//  budget-tracker
//
//  Created by A H on 3/28/24.
//

import SwiftUI

struct WelcomeScreen: View {

  var body: some View {
    VStack {
      Text("Welcome Tester!")
        .font(.title)
        .padding()
        
          NavigationLink{
              BudgetSelectionView()
          }label: {
              Text("Current Budgets")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
          }
        
          NavigationLink{
              CreateBudgetView()
          }label: {
                Text("Create A New Budget")
                  .foregroundColor(.white)
                  .padding()
                  .background(Color.gray)
                  .cornerRadius(10)
              }
            }
          }
        }

struct CreateBudgetView: View {

    @State private var budgetName = ""
      @Environment(\.presentationMode) var presentationMode

      var body: some View {
        VStack {
          TextField("Enter A New Budget", text: $budgetName)
            .padding()

            Button(action: {
                    print("Creating")
                  }) {
                    Text("Create The Budget")
                      .foregroundColor(.white)
                      .padding()
                      .background(Color.gray)
                      .cornerRadius(10)
                  }
                }
              }
        }

struct BudgetSelectionView: View {

  @State private var budgets: [Budget] = [
    Budget(name: "Weekly: Spending"),
    Budget(name: "Monthly: Rent"),
  ]
  @State private var selectedBudgetIndex: Int? = nil
    
  var body: some View {
    NavigationView {
      List {
        ForEach(budgets) { budget in
          NavigationLink(destination: home()) {
            Text(budget.name)
          }
        }
      }
      .navigationTitle("Budget")
      .onAppear {
        selectedBudgetIndex = 0
      }
    }
  }
}

struct ContentView: View {

  var body: some View {
    NavigationView {
      WelcomeScreen()
        .navigationTitle("Budget Tracker")
    }
  }
}

struct AddSubtractView: View {

  @Binding var amount: Double
  @State private var addAmount = 0.0
  let onClose: () -> Void

  var body: some View {
    VStack {
      TextField("Enter amount", value: $addAmount, format: .currency(code: "USD"))
        .padding()

      HStack {
        Button(action: {
          amount += addAmount
          addAmount = 0.0
        }) {
          Text("Add Funds")
            .foregroundColor(.green)
        }

        Button(action: {
          
          if amount >= addAmount {
            amount -= addAmount
          }
          addAmount = 0.0
        }) {
          Text("Pay Bill")
            .foregroundColor(.red)
        }
      }

      Button(action: onClose) {
        Text("Close")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
