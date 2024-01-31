//
//  ContentView.swift
//  Session02
//
//  Created by Pabita Pun on 2024-01-30.
//

// iOS 17.2 - iphone 15 pro

import SwiftUI

/*
 The @State property wrapper is used inside of View objects
 and allows your view to respond to any changes made to
 @State. You use @State for properties that are owned by the
 view that it's contained in. In other words, a view initializes its
 @State properties itself. It does not receive its @State properties
 from another object.
 */

struct ContentView: View {
    @State private var empNameFromUI: String = ""
    @State private var hourlyRateFromUI: String = ""
    @State private var hoursWorkedFromUI: String = ""
    @State private var resultsMessage: String = ""
    @State private var overtimeHoursRate: Double? = 0.0
    @State private var payBeforeOvertime: Double = 0.0
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            // title: app name
            Text("Pay Calculator:")
                .font(.title)
            
            // Employee name, hourly rate & hours worked
//            Text("Employee Name:")
            TextField("Example: Peter Smith", text: $empNameFromUI)
                .disableAutocorrection(true)
                .textInputAutocapitalization(/*@START_MENU_TOKEN@*/.never/*@END_MENU_TOKEN@*/)
            
            Text("Hourly Rate")
            TextField("Example: 18.50", text: $hourlyRateFromUI)
                .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            
            Text("Hours Worked")
            TextField("Example: 10", text: $hoursWorkedFromUI)
                .keyboardType(.numberPad)
            
            HStack {
                Button {
                    // Validate the form fields
                    if (empNameFromUI.isEmpty == true) {
                        print("ERROR: Name must be provided")
                        return
                    }
                    // entering numbers validation
                    guard let rate =
                            Double(hourlyRateFromUI), let 
                            hours =
                            Double(hoursWorkedFromUI) else {
                        print("ERROR: Must be numbers")
                        return
                    }
                    print("Successful")
                    
                    // Calculate the pay hoursWorked * rate
                    var finalPay = 0.0
                    
                    payBeforeOvertime = rate * hours
                    
                    if (Double(hoursWorkedFromUI)! > 20.0) {
                        overtimeHoursRate = (Double(hourlyRateFromUI) ?? 0) * 0.15 + (Double(hourlyRateFromUI) ?? 0)
                        finalPay = hours * (overtimeHoursRate ?? 0)
                    } else {
                        finalPay = rate * hours
                    }
                    
                    self.resultsMessage = """
                    PAY for \(empNameFromUI)
                    Pay Before overtime: $\(String(format: "%.2f", payBeforeOvertime))
                    Amount Earned: $\(String(format: "%.2f", finalPay))
                    
                    """
                    print(resultsMessage)
                    
                } label: {
                    Text("Calculate Pay")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                
                Button {
                    // reset all the stored prop to default value
                    self.empNameFromUI = ""
                    self.hourlyRateFromUI = ""
                    self.hoursWorkedFromUI = ""
                } label: {
                    Text("Clear Form")
                        .buttonStyle(.bordered)
                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                }
            }
            
            Spacer()
            
            
        }
        .padding()
        Text(resultsMessage)
    }
}

#Preview {
    ContentView()
}
