//
//  SecondView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var user : User
    
    var body: some View {
        VStack{
//            Text("Second View")
//            Spacer()
            
            TabView{
                SunflowerView().environmentObject(self.user)
                    .tabItem{
                        Image(systemName: "staroflife")
                            .foregroundColor(.blue)
                        
                        Text("SunFlower")
                    }
                
                TajView()
                    .tabItem{
                        Image(systemName: "building.columns")
                            .foregroundColor(.blue)
                        
                        Text("Taj")
                    }
                
                StephenView()
                    .tabItem{
                        Image(systemName: "sportscourt.fill")
                            .foregroundColor(.blue)
                        
                        Text("NBA")
                    }
                
                SweetView()
                    .tabItem{
                        Image(systemName: "xbox.logo")
                            .foregroundColor(.blue)
                        
                        Text("Tiramisu")
                    }
            }
            
        }
        .padding()
        .background(.yellow)
        
        .navigationTitle("Second Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
