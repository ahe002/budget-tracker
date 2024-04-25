//
//  ContentView.swift
//  budget-tracker
//
//  Created by A H on 3/28/24.
//

import SwiftUI

struct WelcomeScreen: View {

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)

      VStack {
        Spacer()
        Text("Budget Tracker")
          .font(.system(size: 80))
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding(.top)

        Text("Welcome Tester!")
          .font(.largeTitle)
          .foregroundColor(.white)

        Spacer()

        NavigationLink {
          BudgetSelectionView()
        } label: {
          HStack {
            Image(systemName: "dollarsign.circle")
              .foregroundColor(.white)
            Text("Current Budgets")
          }
          .foregroundColor(.white)
          .padding()
          .background(Color.black)
          .cornerRadius(10)
        }

        NavigationLink {
          CreateBudgetView(delegate: BudgetSelectionView())
        } label: {
          HStack {
            Image(systemName: "dollarsign.circle")
              .foregroundColor(.white)
            Text("Create A New Budget")
          }
          .foregroundColor(.white)
          .padding(.horizontal)
          .padding(.vertical, 10)
          .background(Color.black.opacity(0.5))
          .cornerRadius(10)
        }
      }
    }
  }
}

struct Budget {
  let name: String
  let value: Double
}

class BudgetDelegate: CreateBudgetDelegate {
  func didCreateBudget(budget: Account) {
    
  }
}

protocol CreateBudgetDelegate {
  func didCreateBudget(budget: Account)
}

struct CreateBudgetView: View {

  @State private var budgetName = ""
  @State private var value: Double = 0.0
  @Environment(\.presentationMode) var presentationMode
  var delegate: CreateBudgetDelegate?

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)

      VStack {
        TextField("Enter Budget Name", text: $budgetName)
          .padding()
          .foregroundColor(.white)

        TextField("Enter Budget Value", value: $value, format: .currency(code: "USD"))
          .padding()
          .foregroundColor(.white)

        Button(action: {
          let newBudget = Account(balance: value, name: budgetName)
          delegate?.didCreateBudget(budget: newBudget)
          presentationMode.wrappedValue.dismiss()

          print("Creating budget named: \(budgetName) with value: \(value)")
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
}


struct BudgetSelectionView: View, CreateBudgetDelegate {
    
    @State private var budgets: [Account] = [
        Account(balance: 1000.0, name: "Weekly: Spending"),
        Account(balance: 1000.0, name: "Monthly: Rent"),
    ]
    
    @State private var selectedBudgetIndex: Int? = nil
    
    func didCreateBudget(budget: Account) {
        if let index = budgets.firstIndex(where: { $0.id == budget.id }) {
            budgets[index].balance = budget.balance
            print("Updated account balance: \(budgets[index].balance)")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(budgets) { budget in
                    NavigationLink(destination: home()) {
                        HStack {
                            Text(budget.name)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            .listStyle(.plain)
            .navigationTitle("Budgets")
            .listRowSeparator(.visible)
            .background(LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

struct AddSubtractView: View {
    @Binding var account: Account
    @State private var addAmount = 0.0
    let onClose: () -> Void
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.black)
                    TextField("Enter amount", value: $addAmount, format: .currency(code: "USD"))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        account.balance += addAmount
                        addAmount = 0.0
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Text("Add Funds")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        if account.balance >= addAmount {
                            account.balance -= addAmount
                        }
                        addAmount = 0.0
                    }) {
                            HStack {
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                                Text("Pay Bill")
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                        }
                }
                
                Button(action: onClose) {
                    Text("Close")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    let delegate = BudgetDelegate()
    var body: some View {
        NavigationView {
            WelcomeScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
    }
}
