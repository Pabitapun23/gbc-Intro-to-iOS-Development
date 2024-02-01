//
//  Session03_View.swift
//  Session03
//
//  Created by Pabita Pun on 2024-01-31.
//

import SwiftUI

struct Session03_View: View {
    var body: some View {
        VStack {
            // loop
            ForEach(1..<10) {
                x in
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("--------------")
                Text("Hello, World!")
            }
            
            ForEach(3..<7) {
                abc in Text("Hello \(abc)").font(.title)
            }
        }
    }
}

#Preview {
    Session03_View()
}
