//
//  ContentView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emailFromUI : String = "admin"
    @State private var passwordFromUI : String = "admin123"
    @State private var linkSelection : Int? = nil
    
    private var userObj : User = User()
    
    var body: some View {
        NavigationStack{
            VStack {
                
//                NavigationLink(destination: HomeScreen(), tag: 1, selection: self.$linkSelection){}
                
                NavigationLink(destination: HomeScreen(emailAddress: self.emailFromUI).environmentObject(self.userObj),
                               tag: 1, selection: self.$linkSelection){}
                
                NavigationLink(destination: FirstView(emailAddress: self.emailFromUI).environmentObject(self.userObj), tag: 2, selection: self.$linkSelection){}
                
                TextField("Enter email address", text: self.$emailFromUI)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                TextField("Enter password", text: self.$passwordFromUI)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                NavigationLink{
                    
                    FirstView().environmentObject(self.userObj)
                }label: {
                    //create an account if you don't have one
                    Text("Go to FirstView")
                }//NavigationLink
                
//                NavigationLink("FirstScreen", destination: FirstView())
                
                Button{
                    if (!self.emailFromUI.isEmpty && !self.passwordFromUI.isEmpty
//                        && self.emailFromUI == "admin" &&
//                        self.passwordFromUI == "admin123"
                    ){
                        //associate data to the user class object
                        self.userObj.email = emailFromUI
                        self.userObj.password = passwordFromUI
                        
                        //navigate to home screen
                        self.linkSelection = 1
                    }else{
                        //go to first screen
                        self.linkSelection = 2
                    }
                }label: {
                    //go to home screen 
                    Text("Login")
                }
                
                
                Text("Env Obj : \(self.userObj.email)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(.blue)
                
            }//Vstack
            .padding()
            .onAppear(){
                if (!self.userObj.email.isEmpty || self.userObj.email != "NA"){
                    self.emailFromUI = self.userObj.email
                }
            }
            
            .navigationTitle("Content View")
            
        }//NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
