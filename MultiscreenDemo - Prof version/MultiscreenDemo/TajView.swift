//
//  TajView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct TajView: View {
    var body: some View {
        VStack{
            Text("Taj Mahal")
            
            Image("taj")
                .resizable()
        }
    }
}

struct TajView_Previews: PreviewProvider {
    static var previews: some View {
        TajView()
    }
}
