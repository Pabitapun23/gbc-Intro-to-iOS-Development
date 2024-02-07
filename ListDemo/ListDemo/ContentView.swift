//
//  ContentView.swift
//  ListDemo
//
//  Created by Pabita Pun on 2024-02-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bookList = [Book]()
    @State private var searchAuthorName: String = ""
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var isFiction: Bool = false
    
    var body: some View {
        NavigationStack {
            
            if (self.bookList.count > 0) {
                List {
                    
                    Section(header: Text("Fiction"), footer: Text("This is our most popular segment")) {
                        //                ForEach(bookList) { book in
                        ForEach(self.getBook(searchTerm: self.searchAuthorName)) { book in
                            
                            if (book.isFiction) {
                                NavigationLink {
                                    // destination
                                    BookDetailView(currentBook: book)
                                } label: {
                                    BookListTile(book: book)
                                } // NavigationLink
                                
                            } // if
                            
                        } // ForEach
                        .onDelete(perform: { indexSet in
                            
                            print(#function, "indexSet : \(indexSet)")
        //                    print(#function, "trying to delete book : \(self.bookList)")
                            
                            self.bookList.remove(atOffsets: indexSet)
                        }) // onDelete
                    }// Section
                    
                    Section(header: Text("Non-Fiction")) {
                        //                ForEach(bookList) { book in
                        ForEach(self.getBook(searchTerm: self.searchAuthorName)) { book in
                            
                            if (!book.isFiction) {
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
                            }
                            
                        } // ForEach
                        .onDelete(perform: { indexSet in
                            
                            print(#function, "indexSet : \(indexSet)")
        //                    print(#function, "trying to delete book : \(self.bookList)")
                            
                            self.bookList.remove(atOffsets: indexSet)
                        }) // onDelete
                    }// Section

                } // List
                .searchable(text: self.$searchAuthorName, prompt: "Enter author name to search")
            } // if
            else {
                Text("Sorry. We don't have any books for now. We are working on restocking. Check back later.")
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Enter new book details")
                TextField("Enter book title", text: self.$title)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                
                TextField("Enter author name", text: self.$author)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                
                Toggle(isOn: self.$isFiction, label: {Text("Is fiction book? ")})
                    
                Button {
                    // perform necessary validations on input
                    // add the new book info to the bookList
                    self.bookList.append(Book(title: self.title, author: self.author, isFiction: self.isFiction))
                    
                    // clear up the inputs for the next one
                    self.title = ""
                    self.author = ""
                    self.isFiction = false
                } label: {
                    Text("Add")
                }.buttonStyle(.borderedProminent)
            }
            
            .navigationTitle("List Demo")
        } // NavigationStack
        .padding()
        .onAppear() {
            // this event will be performed when the VStack appears on screen
            var bookObj = Book(title: "The Alchemist", author: "Paulo C", isFiction: true)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Wise or Otherwise", author: "Sudha M.", isFiction: false)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Becoming", author: "Obama M.", isFiction: false)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Wonders of wonderland", author: "Obama M.", isFiction: true)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Think like a monk", author: "Jay S.", isFiction: false)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Sky is pink", author: "Unknown", isFiction: true)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Evening in Paris", author: "Agatha C", isFiction: true)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Harry Potter", author: "JK R.", isFiction: true)
            self.bookList.append(bookObj)
            
            bookObj = Book(title: "Mastering iOS", author: "Matt N.", isFiction: false)
            self.bookList.append(bookObj)
        } // onAppear
    } // body
    
    
    // function for getting book in searching system
    private func getBook(searchTerm : String) -> [Book] {
        
        if (searchTerm.isEmpty) {
            // return original list of books
            return self.bookList
        } else {
            // search for given term in the list and returns the matching objects
            var resultList: [Book] = []
            
            for book in self.bookList {
                if (book.author.contains(searchTerm)) {
                    resultList.append(book)
                }
            } // for
            
            return resultList
        }
    }
}

#Preview {
    ContentView()
}
