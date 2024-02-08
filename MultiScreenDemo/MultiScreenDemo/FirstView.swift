//
//  FirstView.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

import SwiftUI

struct FirstView: View {
    
    var emailAddress: String = "Guest"
    @EnvironmentObject var user : User
    
    var body: some View {
        VStack {
            Text("First View")
            
            Text("Hey \(emailAddress), please provide your details to create the account")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Env Obj: \(self.user.email)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            NavigationLink {
                SecondView().environmentObject(self.user)
            } label: {
                Text("Go to Second Screen")
            }
            
            Spacer()
            
        }
        .padding()
        .background(.green)
        .navigationTitle("First Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FirstView()
}
