//
//  SunflowerView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct SunflowerView: View {
    
    @EnvironmentObject var user : User
    @State private var emailFromUI : String = ""
    
    var body: some View {
        
        VStack{
            Text("Sunflower")
            
            Text("Enter updated email : ")
            
            TextField("Enter email address", text: self.$emailFromUI)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            Button{
                if (!self.emailFromUI.isEmpty){
                    self.user.email = self.emailFromUI
                }
            }label: {
                Text("Update")
            }
            
            Image("sunflower")
                .resizable()
            
            Spacer()
            
            Text("Env Obj : \(self.user.email)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(.blue)
        }
        .onAppear(){
            self.emailFromUI = self.user.email
        }
    }
}

struct SunflowerView_Previews: PreviewProvider {
    static var previews: some View {
        SunflowerView()
    }
}
