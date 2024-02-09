//
//  HomeScreen.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct HomeScreen: View {
    
    var emailAddress : String
    @EnvironmentObject var userData : User
    
    var body: some View {
        VStack{
            Text("Home Screen")
            
            Text("Welcome \(emailAddress)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Welcome User \(self.userData.email)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(.blue)
        
        .navigationTitle("Home Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(emailAddress: "Preview User")
    }
}
