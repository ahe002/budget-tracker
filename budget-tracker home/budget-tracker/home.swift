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
      ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
              .ignoresSafeArea(.all)

      VStack(spacing: 30) {
        HStack {
          Image(systemName: "dollarsign.circle.fill")
            .foregroundColor(.black)
            .font(.title)
          Text("Account Name")
            .font(.custom("TitleFont", size: 30))
            .foregroundColor(.white)
          Spacer()
        }
        Text("$ \(accountBalance, specifier: "%.2f")")
          .font(.system(size: 48, weight: .bold))
          .foregroundColor(accountBalance > 0 ? .white : .black) 
          .padding(.bottom)

        ProgressView(value: accountBalance, total: 1000)
          .accentColor(.black)

        Button(action: {
          showAddSubtractView.toggle()
        }) {
          Text("Add/Subtract Money")
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.gray)
            .cornerRadius(20)
        }
      }
      .padding()
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
