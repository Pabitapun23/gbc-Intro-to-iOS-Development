//
//  Session03_Exercise.swift
//  Session03
//
//  Created by Pabita Pun on 2024-01-31.
//

import SwiftUI

struct Session03_Exercise: View {
    @State private var selectedCoffeeOptions: [Bool] = [false, true, false, false, true]
   
    var coffeeOptions = ["cream", "milk", "sugar", "whipped cream", "sprinkles"]
    
    var body: some View {
        VStack {
            Text("Options to add into Coffee")
            
            ForEach (0..<coffeeOptions.count) {
                i in  Toggle("\(coffeeOptions[i])", isOn: $selectedCoffeeOptions[i])
            }
            
        }.padding(.all)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Session03_Exercise()
}
