import UIKit

class AnotherScreenViewController: UIViewController {

    // MARK: data recieving variables
    // - customer name from screen 1
    var customerName:String = ""
    // - coupon code from screen 1
    var couponCode:String = ""
    
    // MARK: Outlets
    @IBOutlet weak var lblResults:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("The other screen loaded")
        print("Data from screen 1:")
        print("Customer name: \(customerName)")
        print("Coupon code: \(couponCode)")
        
    
        // 4. check if code is valid
        var price:Double = 20.00
        if (couponCode.starts(with: "OFFER") == true) {
            // coupon code is valid they get 15% off
            price = price * 0.85
        }

        // 4. if yes, output success
        let quantity:Double = 1
        let subtotal = quantity * price
        let tax = subtotal * 0.13
        let finalCost = subtotal + tax

        let output = """
            Order for customer: \(customerName)
            Quantity: \(quantity)
            Price per pizza: \(price)
            Subtotal: \(subtotal)
            Tax: \(tax)
            You must pay: \(finalCost)
        """

        print(output)

        lblResults.text = output
        
        
    }
    

}
