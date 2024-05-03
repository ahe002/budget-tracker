//
//  home.swift
//  budget-tracker
//
//  Created by A H on 4/11/24.
//

import SwiftUI

struct home: View {

  // State variable to store account balance (initially set to 1000)
  @State private var accountBalance = 1000.0

  // State variable to control visibility of AddSubtractView (initially hidden)
  @State private var showAddSubtractView = false

  var body: some View {
    ZStack {
      // Create a background gradient with gray to white transition
      LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all) // Stretch background to fill entire screen

      VStack(spacing: 30) { // Stack elements vertically with spacing

        HStack { // Arrange elements horizontally
          Image(systemName: "dollarsign.circle.fill") // Display dollar sign icon
            .foregroundColor(.black) // Set icon color to black
            .font(.title) // Set icon font size to title
          Text("Account") // label text "Account"
            .font(.custom("TitleFont", size: 30))
            .foregroundColor(.white)
          Spacer()
        }

        // Display account balance
        Text("$ \(accountBalance, specifier: "%.2f")")
          .font(.system(size: 48, weight: .bold))
          .foregroundColor(accountBalance > 0 ? .white : .black) // Set color based on balance
          .padding(.bottom)

        // Progress bar representing account balance progress towards a total
        ProgressView(value: accountBalance, total: 1000)
          .accentColor(.black)

        // Button to toggle visibility of AddSubtractView
        Button(action: {
          showAddSubtractView.toggle() // Toggle  showAddSubtractView
        }) {
          Text("Add/Subtract Money") //  label text
            .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.gray)
          .cornerRadius(20)
        }
      }
      .padding()
    }

    // Present AddSubtractView as a sheet when showAddSubtractView is true
    .sheet(isPresented: $showAddSubtractView) {
      AddSubtractView(amount: $accountBalance, onClose: { //  updates showAddSubtractView
        showAddSubtractView.toggle() // Toggle showAddSubtractView 
      })
    }
  }
}

struct Budget: Identifiable {
 let id = UUID()
 let name: String
}



#Preview {
  home()
}
