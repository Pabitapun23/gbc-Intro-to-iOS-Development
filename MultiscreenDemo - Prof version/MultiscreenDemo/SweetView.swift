//
//  SweetView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct SweetView: View {
    var body: some View {
        
        VStack{
            Text("Sweet screen")
            
            Image("tiramisu")
                .resizable()
        }
    }
}

struct SweetView_Previews: PreviewProvider {
    static var previews: some View {
        SweetView()
    }
}
