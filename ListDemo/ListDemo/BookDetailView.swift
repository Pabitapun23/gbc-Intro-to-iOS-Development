//
//  BookDetailView.swift
//  ListDemo
//
//  Created by Pabita Pun on 2024-02-06.
//

import SwiftUI

struct BookDetailView: View {
    var currentBook : Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            // reuse swift view
            
//            BookListTile(book: currentBook)
            
            Text("Title: \(self.currentBook.title)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.accentColor)
            
            Text("Author: \(self.currentBook.author)")
                .font(.title2)
            
            if (self.currentBook.isFiction) {
                Text("Fiction")
            } else {
                Text("Non-Fiction")
            }
            
            Spacer()
        } // VStack
        .navigationTitle("Book Details")
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
