//
//  ContentView.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

// 2 to 6 tabs are permitted, not more than 6

import SwiftUI

struct ContentView: View {
    
    @State private var emailFromUI : String = ""
    @State private var passwordFromUI : String = ""
    @State private var linkSelection : Int? = nil
    
    private var userObj : User = User()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // to activate it programmatically use tag (Int value)
//                NavigationLink(destination: HomeScreen(emailAddress: self.emailFromUI), tag: 1, selection: self.$linkSelection){}        // {} - won't be visible on screen
                
                NavigationLink(destination: HomeScreen(emailAddress: self.emailFromUI).environmentObject(self.userObj), tag: 1, selection: self.$linkSelection){}        // {} - won't be visible on screen
                NavigationLink(destination: FirstView(emailAddress: self.emailFromUI).environmentObject(self.userObj), tag: 2, selection: self.$linkSelection){}
                
                TextField("Enter email address", text: self.$emailFromUI)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Enter password", text: self.$passwordFromUI)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                // 1st option
                NavigationLink {
                    FirstView().environmentObject(self.userObj)
                } label: {
                    // create an account if you don't have one
                    Text("Go to FirstView")
                } // NavigationLink
                
                // 2nd option
//                NavigationLink("First Screen", destination: FirstView())
                
                Button {
                    if (!self.emailFromUI.isEmpty && !self.passwordFromUI.isEmpty
//                       && self.emailFromUI == "admin" &&
//                        self.passwordFromUI == "admin123"
                    ) {
                        // associate data to the user class object
                        self.userObj.email = emailFromUI
                        self.userObj.password = passwordFromUI
                        
                        // navigate to home screen
                        self.linkSelection = 1
                    } else {
                        // go to first screen
                        self.linkSelection = 2
                    }
                } label: {
                    // Go to home screen
                    Text("Login")
                }
                
                Spacer()
                
//                Text("Env Obj: \(self.user.email)")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
                
            } // VStack
            .padding()
            .onAppear() {
                if (!self.userObj.email.isEmpty || self.userObj.email != "NA") {
                    self.emailFromUI = self.userObj.email
                }
            }
            
            .navigationTitle("Content View")
            
            
        } // NavigationStack
    } // body
}

#Preview {
    ContentView()
}
