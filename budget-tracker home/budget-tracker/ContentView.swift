//
//  ContentView.swift
//  budget-tracker
//
//  Created by A H on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          // home page
          Text("Budget Tracker")
            .font(.title)
          Text("Track your money without the worry of data breaches")
            .padding(.bottom)

          HStack {
            Button(action: {
              // will enter the app
            }) {
              Text("Enter")
            }
            .padding(.horizontal)

          }
        }
      }
}



#Preview{
    ContentView()
  }
