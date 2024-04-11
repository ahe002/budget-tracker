//
//  home.swift
//  budget-tracker
//
//  Created by A H on 4/11/24.
//

import SwiftUI

struct home: View {

  @State private var accountBalance = 1000.0
  @State private var showAddSubtractView = false

  var body: some View {
    VStack {
      Text("My Account")
        .font(.title)

      Text("$ \(accountBalance, specifier: "%.2f")" )
        .font(.largeTitle)
        .padding()

      Button(action: {
        showAddSubtractView.toggle()
      }) {
        Text("Add/Subtract Money")
      }
    }
    .sheet(isPresented: $showAddSubtractView) {
      AddSubtractView(amount: $accountBalance, onClose: {
        showAddSubtractView.toggle()
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
