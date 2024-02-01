//
//  ContentView.swift
//  Session03
//
//  Created by Pabita Pun on 2024-01-31.
//

/*
 Toggle (Switch)
 Slider
 Stepper
 Date Picker
 */

import SwiftUI

struct ContentView: View {
    
    @State private var switchValue: Bool = false
    @State private var switchValue2: Bool = false
    
    // slider
    @State private var sliderValue: Double = 0.0
    
    // stepper
    @State private var stepperValue: Int = 0
    
    // DatePicker
    @State private var selectedDate: Date = Date.now
    
    var body: some View {
        VStack {
            Text("Session 03")
            
            // Toggle (Switch)
            Toggle("Airplane Mode", isOn: $switchValue)
            Toggle("Airplane2 Mode", isOn: $switchValue2)
            
            Button("Push Me") {
                print("Switch Value: \(switchValue)")
                print("Switch Value 2: \(switchValue2)")
            }
            
            // Slider
    //        Slider(value: $sliderValue, in: 10...20)
            Slider(value: $sliderValue, in: -10...10, step: 1)
            Text("Slider value is: \(sliderValue)")
            
            // Stepper
            Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
            }
            
            Stepper("Number", value: $stepperValue, in: 2...10)
            Text("Stepper Value: \(stepperValue)")
            
            // Date Picker
//            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            Group {
                // Shows date and time
                DatePicker("Date Picker", selection: $selectedDate)
                // shows time
                DatePicker("Time Only", selection: $selectedDate, displayedComponents: .hourAndMinute)
                DatePicker("Date Only", selection: $selectedDate, displayedComponents: .date)
                DatePicker("Date in future", selection: $selectedDate, in: Date.now...Date.now.addingTimeInterval(4 * 24 * 60 * 60))
                DatePicker("Date Picker demo", selection: $selectedDate).labelsHidden()
            }
            
            
            
    //        MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
    //
        }.padding()
    }
}

#Preview {
    ContentView()
}
