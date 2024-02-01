//
//  Session03_Exercise2.swift
//  Session03
//
//  Created by Pabita Pun on 2024-01-31.
//

import SwiftUI

struct Session03_Exercise2: View {
    
    var imageName = ["bellsprout", "bulbasaur", "charmander"]
    var imagesName = ["bellsprout", "bulbasaur", "charmander", "ditto", "eevee", "face", "meowth", "pikachu", "pokeball", "psyduck", "snorlax", "squirtle"]
    var body: some View {
        Text("Pokemon")
        HStack {
            ForEach (0..<imageName.count) {
                i in Image(imageName[i]).resizable().frame(width: 80.0, height: 80.0)
            }
        }.padding()
        
        HStack {
            ForEach (0..<imagesName.count) {
                i in Image(imagesName[i]).resizable().frame(width: 20.0, height: 20.0)
            }
        }.padding()

    }
}

#Preview {
    Session03_Exercise2()
}
