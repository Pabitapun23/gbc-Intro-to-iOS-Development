//
//  SettingView.swift
//  Session11-UserDefaultsInApp
//
//  Created by Pabita Pun on 2024-02-12.
//

import SwiftUI

struct SettingView: View {
    @State private var currentTemp: Float = 20.0
    @State private var minTemp: Float = 0.0
    @State private var fontSize: Int = 1
    @State private var date: Date = Date.now
    @State private var maintenanceDate: Date = Date.now
    
    var body: some View {
        VStack {
            Text("Thermostate Setting")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 20.0)
            
            // For current Temperature
            Section {
                Text("Current Temperature")
                
                HStack {
                    Slider(value: self.$currentTemp, in: 10...30, step: 0.5, onEditingChanged: { _ in
                        print("Current Temp changed to : \(self.currentTemp)")
                        
                        // UserDefaults - save/update value
                        // setValue - comes with value and key
                        UserDefaults.standard.setValue(self.currentTemp, forKey: "KEY_TEMPERATURE")
                    }) // Slider
                        
                } // HStack
                .padding(.horizontal)
                
                // display current temp
                Text(">>> \(currentTemp)")
            } // Section
            
            // For Min Temperature
            Section {
                Text("Minimum Temperature")
                    .padding(.top)
                
                HStack {
                    Slider(value: self.$minTemp, in: 10...30, step: 0.5, onEditingChanged: { _ in
                        print("Min Temp changed to : \(self.minTemp)")
                        
                        // UserDefaults - save/update value
                        // setValue - comes with value and key
                        UserDefaults.standard.set(self.minTemp, forKey: "KEY_MIN_TEMPERATURE")
                        
                    }) // Slider
                        
                } // HStack
                .padding(.horizontal)
                
                // display min temp
                Text("Min Temp \(minTemp)")
            } // Section
            
            
            // Date Picker
            DatePicker(selection: self.$maintenanceDate, displayedComponents: [.date]) {
                Text("Maintenance Date")
            }.padding()
                .onChange(of: self.maintenanceDate, perform: { _ in
                    // save/update the data in UserDefaults
                    
                    UserDefaults.standard.setValue(self.maintenanceDate, forKey: "KEY_DATE")
                }) // Date Picker
            
            // custom font(), font size and syle (i.e Arial)
            // add variable size
            
            // Stepper for Font Size
            Stepper("Font Size: \(fontSize)", value: $fontSize, in: 6...30)
                .onChange(of: fontSize) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "KEY_FONT")
             }
            
            Spacer()
            
        } // VStack
        
    } // body
}

#Preview {
    SettingView()
}
