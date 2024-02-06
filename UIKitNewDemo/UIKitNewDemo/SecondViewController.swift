//
//  SecondViewController.swift
//  UIKitNewDemo
//
//  Created by Pabita Pun on 2024-02-05.
//

import UIKit

class SecondViewController: UIViewController {
    
    // data receiving from screen 1
    var customerName: String = ""
    var couponCode: String = ""
    
    @IBOutlet weak var lblResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Data from screen 1")
        print("Customer Name: \(customerName)")
        print("Coupon: \(couponCode)")
        
        // validation
        var price: Double = 20.00
        let finalCost = price
        
        let output = "\(finalCost)"
        lblResults.text = output
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
