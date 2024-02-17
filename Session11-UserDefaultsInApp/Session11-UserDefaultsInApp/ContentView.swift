//
//  ContentView.swift
//  Session11-UserDefaultsInApp
//
//  Created by Pabita Pun on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var temp: Float = 0.0
    @State private var minimumTemp: Float = 0.0
    @State private var mDate: Date = Date.now
    
    // Stepper
    @State private var inputText: String = ""
    @State private var fontSize: Int = 0
    @State private var selectedFont: String = "Arial"
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: SettingView()) {
                    Text("Thermo Screen")
                }
                Text("Current Temp: \(self.temp)")
                Text("Min Temp: \(self.minimumTemp)")
                Text("Maintenance Date: \(self.mDate)")
                
                
                // Stepper part to change font size
                TextEditor(text: $inputText)
                    .font(.custom(selectedFont, size: CGFloat(fontSize)))
                
                Spacer()
                
            } // VStack
            .padding()
            .onAppear() {
                if UserDefaults.standard.float(forKey: "KEY_TEMPERATURE") != 0 {
                    self.temp = UserDefaults.standard.float(forKey: "KEY_TEMPERATURE")
                }
                
                if UserDefaults.standard.float(forKey: "KEY_MIN_TEMPERATURE") != 0 {
                    self.minimumTemp = UserDefaults.standard.float(forKey: "KEY_MIN_TEMPERATURE")
                }
                
                // For date picker
                self.mDate = UserDefaults.standard.object(forKey: "KEY_DATE") as? Date ?? Date()
                
                // For Font Size - stepper
                if UserDefaults.standard.float(forKey: "KEY_FONT") != 0 {
                    self.fontSize = UserDefaults.standard.integer(forKey: "KEY_FONT")
                }
                
                
            } // onAppear
            
        } // NavigationView
       
        
       
    } // body
}

#Preview {
    ContentView()
}
