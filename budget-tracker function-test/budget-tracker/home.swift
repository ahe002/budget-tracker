//
//  home.swift
//  budget-tracker
//
//  Created by A H on 4/11/24.
//

import SwiftUI

struct home: View {

    @State private var account: Account = Account(balance:1000.0,name:"")
   @State private var showAddSubtractView = false
    
    func toggleAddSubtractView() {
        showAddSubtractView.toggle()
      }

  var body: some View {
      ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
              .ignoresSafeArea(.all)

      VStack(spacing: 30) {
          Button(action: toggleAddSubtractView) {
          }
          .buttonStyle(.plain)
        HStack {
          Image(systemName: "dollarsign.circle.fill")
            .foregroundColor(.black)
            .font(.title)
          Text("Account")
                .font(.largeTitle)
            .foregroundColor(.white)
          Spacer()
        }
          Text("$ \(account.balance, specifier: "%.2f")")
          .font(.system(size: 48, weight: .bold))
          .foregroundColor(account.balance > 0 ? .white : .black)
          .padding(.bottom)

          ProgressView(value: account.balance, total: 1000)
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
        AddSubtractView(account: $account, onClose:toggleAddSubtractView)
      }
    }
  }

struct Account: Identifiable {
 let id = UUID()
 var balance: Double
 let name: String
}



#Preview {
  home()
}
