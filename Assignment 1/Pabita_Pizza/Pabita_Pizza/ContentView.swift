//
//  ContentView.swift
//  Pabita_Pizza
//
//  Created by Pabita Pun on 2024-02-02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pizzaTypeIsNonVeg: Bool = true
    
    // picker values for pizza sizes
    var sizes = ["Small", "Medium", "Large", "Extra Large"]
    
    // selected picker value (default)
    @State private var selectedSize: String = "Medium"
    
    @State private var quantity: Int = 1
    @State private var usernameFromUI: String = ""
    @State private var phoneNumberFromUI: String = ""
    @State private var couponCodeFromUI: String = ""
    @State private var isCouponValid : Bool? = false
    
    @State private var showAlert: Bool = false
    @State private var receiptMessage: String = ""
    @State private var errorMsg: String = ""
    
    let salesTax: Double = 0.13     // 13% tax
    // price per pizza based on their size
    var pricePerPizzaArray = [
        "Veg" : [
            "Small" : 5.99,
            "Medium" : 7.99,
            "Large" : 10.99,
            "Extra Large" : 13.99
        ],
        "NonVeg" : [
            "Small" : 6.99,
            "Medium" : 8.99,
            "Large" : 12.99,
            "Extra Large" : 15.00
        ]
    ]
    
    var body: some View {
        // Navigation Bar
        NavigationStack {
            // Name of the application
            Text("Pabita's Pizza Store")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                .padding(.vertical, 10.0)
            
            // Form
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Place an order")
                    .font(.title2)
                    .fontWeight(.bold)
                
                // selection of vegetarian or non-veg pizza.
                // By default, non-vegetarian should be selected.
                Text("Type of pizza: Non-veg or veg?")
                    .fontWeight(.bold)
                Toggle("Non-Veg Pizza", isOn: $pizzaTypeIsNonVeg)
                
                // size of pizza: small, medium, large or extra-large
                // By default: medium size should be selected.
                HStack {
                    Text("Size of pizza:")
                        .fontWeight(.bold)
                    Spacer()
                    
                    Picker(selection: $selectedSize, label: Text("Size of pizza:")) {
                        ForEach(sizes, id: \.self) {
                            Text($0).foregroundColor(.black)
                        }
                    }.foregroundColor(.black) // Picker
                } // HStack
                
                // the quantity of pizzas
                // The minimum allowed quantity is 1, and maximum allowed quantity is 5.
                // The default quantity is 1.
                Text("Quantity:").fontWeight(.bold)
                Stepper("\(quantity)", value: $quantity, in: 1...5)
                
                // User Info - Mandatory fields*
                // Username
                HStack {
                    Text("Username")
                        .fontWeight(.bold)
                    Text("*")
                        .foregroundColor(Color.red)
                } // HStack -> username - label
                TextField("Enter Username", text: $usernameFromUI)
                    .padding(.all, 5.0)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .border(Color.black)
                
                // Phone number
                HStack {
                    Text("Phone number")
                        .fontWeight(.bold)
                    Text("*")
                        .foregroundColor(Color.red)
                } // HStack -> phoneNumber - label
                TextField("Enter Phone number", text: $phoneNumberFromUI).padding(.all, 5.0).keyboardType(.phonePad).border(Color.black)
                
                // coupon code
                Text("Coupon code")
                    .fontWeight(.bold)
                TextField("Enter coupon code", text: $couponCodeFromUI)
                    .padding(.all, 5.0)
                    .border(Color.black, width: 1)
                
                // error message
                Text("\(errorMsg)")
                    .font(.subheadline)
                    .foregroundColor(Color.red)
                
                
                // Button
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        self.placeOrder()
                    } label: {
                        Text ("PLACE ORDER")
                    }
                    .alert(isPresented: self.$showAlert){
                        Alert(title: Text("Your Order Receipt"),
                              message: Text("\(self.receiptMessage)"),
                              dismissButton: .default(Text("Dismiss")){
                            print("alert dismissed")
                        })
                    }
                    .padding(.all, 15.0)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
                    
                    Spacer()
                }
                
            } // VStack - Form
            .padding([.leading, .bottom, .trailing])
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Button{
                            self.dailySpecialOrder()
                        }label:{
                            Text("DAILY SPECIAL")
                        }
                        
                        Button{
                            self.resetOrder()
                            
                        }label: {
                            Text("RESET")
                                .foregroundColor(Color(.red))
                        }
                        
                    }//Menu
                label: {
                    Image(systemName: "menucard.fill")
                        .foregroundColor(Color(.orange))
                }//Menu label
                    
                } // ToolbarItem
            } // toolbar
        } // NavigationStack
        
        Spacer()
    } // body
    
    private func placeOrder() {
        
        // form validation
        // for username
        if (usernameFromUI.isEmpty) {
            print("ERROR - Username must be provided")
            errorMsg = "ERROR - Username must be provided"
            return
        }
        
        // for phonenumber
        if (phoneNumberFromUI.isEmpty) {
            print("ERROR - Phone number must be provided")
            errorMsg = "ERROR - Phone number must be provided"
            return
        }
        
        // success scenario
        if (!usernameFromUI.isEmpty && !phoneNumberFromUI.isEmpty) {
            print("Success")
        }
        
        
        // Calculating the total cost
        var totalPriceBeforeTax : Double = 0.0
        var finalCost : Double = 0.0    // after adding sales tax
        

        // For Pizza Type
        if (pizzaTypeIsNonVeg == true) {
            
            // price before tax = rate * quantity
            totalPriceBeforeTax = pricePerPizzaArray["NonVeg"]![selectedSize]! * Double(quantity)
            
        } else  {
            totalPriceBeforeTax = pricePerPizzaArray["Veg"]![selectedSize]! * Double(quantity)
        }
        
        
        // For coupons
        if (couponCodeFromUI.hasPrefix("OFFER")) {
            // 20% discount on the total pre-tax order price.
            totalPriceBeforeTax -= 0.2 * totalPriceBeforeTax
            isCouponValid = true
        } else {
            isCouponValid = false
        }
        
        if (!couponCodeFromUI.isEmpty && isCouponValid == false) {
            couponCodeFromUI = ""
            errorMsg = "ERROR: Coupon code is invalid"
            print("INVALID COUPON")
            return
        } else {
            errorMsg = ""
            
            // total price after adding tax
            finalCost = totalPriceBeforeTax * salesTax + totalPriceBeforeTax
            
            print("Your Receipt: $\(String(format: "%.2f", finalCost))")
            
            // For showing selected pizza type
            var pizzaType: String = ""
            if (pizzaTypeIsNonVeg) {
                pizzaType = "Non-Veg"
            } else {
                pizzaType = "Veg"
            }
            
            // Receipt
            self.receiptMessage = """
            Selected Pizza: \(pizzaType)
            Size: \(selectedSize)
            Quantity: \(quantity)
            Total Price: $\(String(format: "%.2f", finalCost))
            """
            self.showAlert = true
        }
        
        
    }
    
    private func dailySpecialOrder() {
        pizzaTypeIsNonVeg = true
        selectedSize = "Large"
        quantity = 2
        couponCodeFromUI = "OFFERSPECIAL"
    }
    
    private func resetOrder() {
        pizzaTypeIsNonVeg = true
        selectedSize = "Medium"
        quantity = 1
        usernameFromUI = ""
        phoneNumberFromUI = ""
        couponCodeFromUI = ""
        errorMsg = ""
    }
}

#Preview {
    ContentView()
}
