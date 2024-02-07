//
//  BookListTile.swift
//  ListDemo
//
//  Created by Pabita Pun on 2024-02-06.
//

import SwiftUI

struct BookListTile: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            
            Text(book.author)
                .font(.title2)
        } // VStack
        .onTapGesture {
            // perform necessary operation on list item
            print(#function, "list item selected : \(book.title)")
        }
    } // body
}

struct BookListTile_Previews: PreviewProvider {
    static var  previews: some View {
        BookListTile(book: Book(title: "test", author: "test", isFiction: false))
    }
}
