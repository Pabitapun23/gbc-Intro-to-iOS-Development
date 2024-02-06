//
//  ViewController.swift
//  UIKitNewDemo
//
//  Created by Pabita Pun on 2024-02-05.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var txtCustomerName: UITextField!
    
    @IBOutlet weak var txtCode: UITextField!
    
    @IBOutlet weak var labelResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // debug
        print("Screen 1 loaded")
        
        // click on "Place order"
        // get the name
        // get the code
        // write some logic
        
        // Reset button: clearing the field
        
    }

    @IBAction func placeOrderPressed(_ sender: Any) {
        print("Place Order pressed")
        
        // get the name
        let nameFromUI: String = txtCustomerName.text!
        let codeFromUI: String = txtCode.text!
        
        // name validation
        if (nameFromUI.isEmpty) {
            print("ERROR: Enter again!")
            return
        }
        
        // code validation
        var price: Double = 20.00
        if (codeFromUI.starts(with: "OFFER") == true) {
            price = price * 0.85
        }
        
        let quantity: Double = 1
        let subtotal = quantity * price
        let tax = subtotal * 0.13
        let finalCost = subtotal + tax
        let output = """
            Quantity: \(quantity)
            You must pay: \(finalCost)
        """
        
        print(output)
        labelResults.text = output
    }
    
    
    @IBAction func resetPressed(_ sender: Any) {
        print("Reset pressed")
        
        // reset values
        txtCustomerName.text = ""
        txtCode.text = ""
        labelResults.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Navigating to the second screen")
        
        let customerNameFromUI = txtCustomerName.text!
        let couponCodeFromUI = txtCode.text!
        
        // check condition for form validation here first. Then, do the segue for navigation to another screen.
        
        // send the data
        if let destinationScreen = segue.destination as? SecondViewController {
            print("Sending data to second view")
            destinationScreen.customerName = customerNameFromUI
            destinationScreen.couponCode = couponCodeFromUI
            
            return
        }
    }
    
}

