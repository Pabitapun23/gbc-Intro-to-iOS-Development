//
//  Screen3ViewController.swift
//  Session09Demo
//
//  Created by Tech on 2023-06-08.
//

import UIKit
import SwiftUI

class Screen3ViewController: UIViewController {

    // write a bunch of template code to
    // insert the SwiftUI screen into this container
    @IBOutlet weak var myContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 3 loaded")
        
        let swiftUIView = UIHostingController(rootView:FriendsListView())
        addChild(swiftUIView)
               
       // configure sizing so the swiftUI component has the same hieght/width as parent
       swiftUIView.view.frame = myContainer.bounds
       // add it within the container
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
