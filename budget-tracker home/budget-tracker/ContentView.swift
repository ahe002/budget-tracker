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
      // background that is a gradient with gray to white transition, various variants in all views
      LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)

  
      VStack {
        Spacer()

        // Display "Budget Tracker"
        Text("Budget Tracker")
          .font(.system(size: 80))
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding(.top)

        // Display "Welcome Tester!"
        Text("Welcome Tester!")
          .font(.largeTitle)
          .foregroundColor(.white)

        Spacer()

        // Navigation link to BudgetSelectionView with "Current Budgets" label
        NavigationLink {
          BudgetSelectionView()
        } label: {
          HStack {
            Image(systemName: "dollarsign.circle") //  dollar sign icon
              .foregroundColor(.white)
            Text("Current Budgets") //  label text
          }
          .foregroundColor(.white)
          .padding()
          .background(Color.black)
          .cornerRadius(10)
        }

        // Navigation link to CreateBudgetView with "Create A New Budget" label
        NavigationLink {
          CreateBudgetView()
        } label: {
          HStack {
            Image(systemName: "dollarsign.circle") // dollar sign icon
              .foregroundColor(.white)
            Text("Create A New Budget") // label text
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

  @State private var budgetName = "" // Stores entered budget name
  @State private var value: Double = 0.0 // Stores entered budget value
  @Environment(\.presentationMode) var presentationMode // Used to dismiss the view

  var body: some View {
    ZStack {
      
      LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)

      VStack {
        TextField("Enter Budget Name", text: $budgetName) // Text field for budget name
          .padding()
          .foregroundColor(.white)

        TextField("Enter Budget Value", value: $value, format: .currency(code: "USD")) // Text field for budget value with USD
          .padding()
          .foregroundColor(.white)

        Button(action: {
          print("Creating budget named: \(budgetName) with value: \(value)") // Print entered info to console
          presentationMode.wrappedValue.dismiss() // Dismiss the CreateBudgetView
        }) {
          Text("Create The Budget") // Button label text
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

  // State variable to store an array of Budget structs (initially containing two pre-defined budgets)
  @State private var budget: [Budget] = [
    Budget(name: "Weekly: Spending"),
    Budget(name: "Monthly: Rent"),
  ]

  // State variable to store the index of the selected budget (initially nil - no selection)
  @State private var selectedBudgetIndex: Int? = nil

  var body: some View {
    NavigationView {
      List {
        ForEach(budget) { budget in // Loop through each budget in the "budget" array
          NavigationLink(destination: home()) { // Create a navigation link for each budget
            HStack {
              Text(budget.name) // Display  budget name
                .foregroundColor(.black)
              Spacer()

              Image(systemName: "chevron.right") //  chevron icon (>>)
                .foregroundColor(.gray)
            }
          }
        }
      }
      .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
      .listStyle(.plain)
      .navigationTitle("Budgets") // navigation bar title is "Budgets"
      .listRowSeparator(.visible)
      .background(LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
  }
}

    
struct ContentView: View {
        
    var body: some View {
        NavigationView {
            // Sets navigation to home screen when app is opened
            WelcomeScreen()
            }
        }
    }
    
struct AddSubtractView: View {

  // Binding variable to a Double value representing the account balance (passed from the parent view)
  @Binding var amount: Double

  // State variable to store the entered amount for adding or subtracting (initially 0.0)
  @State private var addAmount = 0.0

  // Closure passed from the parent view to be called when the view is closed
  let onClose: () -> Void

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)

      VStack(spacing: 20) {
        HStack {
          Image(systemName: "dollarsign.circle.fill") // dollar sign icon
            .foregroundColor(.black)
          TextField("Enter amount", value: $addAmount, format: .currency(code: "USD")) // Text field for entering amount in USD
            .foregroundColor(.black)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10)

        }

        HStack(spacing: 20) {
          Button(action: { // Button for adding funds
            amount += addAmount // Add entered amount to the account balance (using binding)
            addAmount = 0.0 // Reset entered amount to 0
          }) {
            HStack {
              Image(systemName: "plus") // plus icon
                .foregroundColor(.white)
              Text("Add Funds") // button label
                .foregroundColor(.white)
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
          }

          Button(action: { // Button for paying bills
            if amount >= addAmount { // Check if enough funds exist
              amount -= addAmount // Subtract entered amount from the account balance 
            }
            addAmount = 0.0 // Reset entered amount to 0
          }) {
            HStack {
              Image(systemName: "minus") // minus icon
                .foregroundColor(.white)
              Text("Pay Bill") // button label
                .foregroundColor(.white)
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(10)
          }
        }

        Button(action: onClose) { // Button to close the view
          Text("Close") // button label
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
            ContentView() // ensures that the program opens its preview on gthe content view
        }
    }
