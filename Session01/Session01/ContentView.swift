//
//  ContentView.swift
//  Session01
//
//  Created by Pabita Pun on 2024-01-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack - Vertical Stack
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, Pabita!")
//                .font(.title)
            Image("pic")
                .resizable(capInsets: EdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0))
                .clipShape(Circle())

            
            Text("My First App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding(10.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
            
            
            Text("Welcome to my app")
            HStack {
                Text("Apple")
                Spacer()    // space in between two items
                Text("Banana")
            }
            Text("Blah!")
            Button("Click Me") {
                // Action here
                print("Btn Pressed")
                for i in 0...3 {
                    print("Number: \(i)")
                }
                
            }
            .padding(.all, 10.0)
            .background(Color.orange)
            .foregroundColor(.white)
            Button("Another Button here!") {
                // Action here
//                print("Btn2")
                btnClick()
            }
            .padding(.all, 10.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            Spacer()
        }
//        .padding()
        // label, textedit, img - color, font
      
    }
}

func btnClick() {
    print("Btn clicked!!!")
}

#Preview {
    ContentView()
}

