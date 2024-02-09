//
//  FirstView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct FirstView: View {
    
    var emailAddress : String = "Guest"
    @EnvironmentObject var user : User
    
    var body: some View {
        
            VStack{
                Text("First View")
                
                Text("Hey \(emailAddress), please provide your details to create the account")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Env Obj : \(self.user.email)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                NavigationLink{
                    SecondView().environmentObject(self.user)
                }label: {
                    Text("Go to second screen")
                }
                
                Spacer()
            }
            .padding()
            .background(.green)
            
            .navigationTitle("First Screen")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
