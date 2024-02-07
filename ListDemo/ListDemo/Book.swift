//
//  Book.swift
//  ListDemo
//
//  Created by Pabita Pun on 2024-02-06.
//

import Foundation

struct Book: CustomStringConvertible, Identifiable {
    var id: UUID = UUID()
    
    var title: String = ""
    var author: String = ""
    var isFiction: Bool = false
    
    var description: String {
        return ("Book Title: \(title), author: \(author), isFiction: \(isFiction)")
    } // description
    
    init(title: String, author: String, isFiction: Bool) {
        self.title = title
        self.author = author
        self.isFiction = isFiction
    } //init
}
