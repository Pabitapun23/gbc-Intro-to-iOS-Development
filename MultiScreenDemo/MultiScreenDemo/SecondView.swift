//
//  SecondView.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
//            Text("Second View")
//            Spacer()
            
            TabView {
                SunflowerView()
                    .tabItem {
                        Image(systemName: "camera.macro")
                            .foregroundColor(.blue)
                        
                        Text("Sunflower")
                    }
                    
                
                TajView()
                    .tabItem {
                        Image(systemName: "building.columns.fill")
                            .foregroundColor(.blue)
                        
                        Text("Taj Mahal")
                    }
                
                StephenView()
                    .tabItem {
                        Image(systemName: "sportscourt.fill")
                            .foregroundColor(.blue)
                        
                        Text("NBA")
                    }
                
                SweetView()
                    .tabItem {
                        Image(systemName: "birthday.cake.fill")
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

#Preview {
    SecondView()
}
