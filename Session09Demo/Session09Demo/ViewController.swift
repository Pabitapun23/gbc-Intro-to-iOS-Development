//
//  ViewController.swift
//  Session09Demo
//
//  Created by Tech on 2023-06-08.
//

import UIKit

class ViewController: UIViewController {

    // MARK: UI variables
    // 1. variable for the name textbox
    @IBOutlet weak var txtCustomerName: UITextField!
    
    // 2. variable for the coupon code textbox
    @IBOutlet weak var txtCouponCode:UITextField!
    
    @IBOutlet weak var lblResults:UILabel!
    
    
    
    // When screen loads, it will execute
    // code in this function
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // debug:
        print("Screen 1 loaded!")
        
        // When the PLACE ORDER Button is pressed
        // 1. Get the name from the textbox
        // 2. Get the coupon code from the textbox
        // 3. Write logic to check if coupon code is valid
        // 4. If yes, clear all fields and place the order
        
        // When the RESET button is pressed:
        // 1. Clear all fields
        
    }


    
    
//    // When the place order button is pressed, this function will execute
//    @IBAction func placeOrderPressed(_ sender: Any) {
//        // code that should execute when the button is pressed
//        print("Place order pressed!")
//        
//        // 1. get the name
//        let nameFromUI:String = txtCustomerName.text!
//        // 2. get cuoupon code
//        let couponCodeFromUI:String  = txtCouponCode.text!
//        
//        // 3. validation
//        if (nameFromUI.isEmpty) {
//            print("ERROR: Name is mandatory")
//            return
//        }
//        // 4. check if code is valid
//        var price:Double = 20.00
//        if (couponCodeFromUI.starts(with: "OFFER") == true) {
//            // coupon code is valid they get 15% off
//            price = price * 0.85
//            
//        }
//        
//        // 4. if yes, output success
//        let quantity:Double = 1
//        let subtotal = quantity * price
//        let tax = subtotal * 0.13
//        let finalCost = subtotal + tax
//        
//        let output = """
//            Quantity: \(quantity)
//            Price per pizza: \(price)
//            Subtotal: \(subtotal)
//            Tax: \(tax)
//            You must pay: \(finalCost)
//        """
//        
//        print(output)
//        
//        lblResults.text = output
//        
//    }
    
    // OPTION 2: Manually connect the button
    // - Manually type the function defintion for a click hander
    // - Associate the click handler with the item on the screen
    // (use this option if the drag and rop from the storbyoard doesn't work proeprly)
    @IBAction func resetPressed(_ sender:Any) {
        print("Reset pressed")
        txtCouponCode.text = ""
        txtCustomerName.text = ""
        lblResults.text = ""
    }
    
    
    // This is a built in function that will execute when the
    // user navigates to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Navigating to next screen")
        // 1. Define the data you want to send to the next screen
        // - name & coupon code
        let customerNameFromUI = txtCustomerName.text!
        let couponCodeFromUI = txtCouponCode.text!
        
        // 2. Send the data
        if let destinationScreen = segue.destination as? AnotherScreenViewController {
            print("sending data to next screen")
            destinationScreen.customerName = customerNameFromUI
            destinationScreen.couponCode = couponCodeFromUI
            return
        }
       
        
        // 3. Done!
    }
    
    
    
    
}


