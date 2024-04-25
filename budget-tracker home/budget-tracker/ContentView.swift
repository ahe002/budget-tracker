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
                    CreateBudgetView()
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


struct CreateBudgetView: View {

    @State private var budgetName = ""
    @State private var value: Double = 0.0
    @Environment(\.presentationMode) var presentationMode
    
    
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
                    
                      print("Creating budget named: \(budgetName) with value: \(value)")
                      presentationMode.wrappedValue.dismiss()
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


struct BudgetSelectionView: View {
    
    @State private var budget: [Budget] = [
        Budget(name: "Weekly: Spending"),
        Budget(name: "Monthly: Rent"),
    ]
    @State private var selectedBudgetIndex: Int? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(budget) { budget in
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
            .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
            .background(LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}
    
    
    struct ContentView: View {
        
        var body: some View {
            NavigationView {
                WelcomeScreen()
            }
        }
    }
    
    struct AddSubtractView: View {
        
        @Binding var amount: Double
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
                            amount += addAmount
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
                            if amount >= addAmount {
                                amount -= addAmount
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
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
