//
//  SunflowerView.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

import SwiftUI

struct SunflowerView: View {
    
    @EnvironmentObject var user : User
    @State private var emailFromUI : String = ""
    
    var body: some View {
        
        VStack {
            Text("Sunflower Screen")
            
            TextField("Enter email address", text: self.$emailFromUI)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            Button {
                if (!self.emailFromUI.isEmpty) {
                    self.user.email = self.emailFromUI
                }
            } label: {
                Text("Update")
            } // Button
            
            Image("sunflower")
                .resizable()
            
        } .onAppear() {
            self.emailFromUI = self.user.email
        }
    }
}

#Preview {
    SunflowerView()
}
