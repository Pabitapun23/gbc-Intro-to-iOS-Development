//
//  HomeScreen.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

import SwiftUI

struct HomeScreen: View {
    
    var emailAddress : String
    @EnvironmentObject var userData : User
    
    var body: some View {
        VStack {
            Text("Home Screen")
            
            Text("Welcome \(emailAddress)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Welcome User \(self.userData.email)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Spacer()
        } // VStack
        .padding()
        .background(.purple)
        .navigationTitle("Home Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeScreen(emailAddress: "Preview User")
}
