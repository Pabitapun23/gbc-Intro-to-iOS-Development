//
//  SweetView.swift
//  MultiScreenDemo
//
//  Created by Pabita Pun on 2024-02-07.
//

import SwiftUI

struct SweetView: View {
    var body: some View {
        VStack {
            Text("Sweet Screen")
            
            Image("tiramisu")
                .resizable()
        }
    }
}

#Preview {
    SweetView()
}
