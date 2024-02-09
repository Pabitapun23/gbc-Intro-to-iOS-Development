//
//  StephenView.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import SwiftUI

struct StephenView: View {
    var body: some View {
        VStack{
            Text("NBA")
            
            Image("stephen")
                .resizable()
        }
    }
}

struct StephenView_Previews: PreviewProvider {
    static var previews: some View {
        StephenView()
    }
}
