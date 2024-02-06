//
//  ThirdViewController.swift
//  UIKitNewDemo
//
//  Created by Pabita Pun on 2024-02-05.
//

import UIKit
import SwiftUI

class ThirdViewController: UIViewController {

    @IBOutlet weak var myContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftUIView = UIHostingController(rootView: FriendsListView())
        addChild(swiftUIView)
        
        swiftUIView.view.frame = myContainer.bounds
        myContainer.addSubview(swiftUIView.view)
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
