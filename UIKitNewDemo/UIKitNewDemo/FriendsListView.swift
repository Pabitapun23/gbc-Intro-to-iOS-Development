//
//  FriendsListView.swift
//  UIKitNewDemo
//
//  Created by Pabita Pun on 2024-02-05.
//

import SwiftUI

struct Friend: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int = 10
}

struct FriendsListView: View {
    // data structure
    @State private var friendsList = [Friend(name: "Amy"), Friend(name: "Bob")]
    
    @State private var friendNameFromUI: String = ""
    
    
    var body: some View {
        VStack {
            Text("My Friends")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            
            Text("Enter Name")
            TextField("Example: David", text: $friendNameFromUI).padding(.leading)
            
            Button {
                // add a friend
                let friendToAdd = Friend(name:friendNameFromUI)
                friendsList.append(friendToAdd)
                
                // clear text boc
                friendNameFromUI = ""
            } label: {
                Text("Add Friend")
            }
            
            List {
                ForEach (friendsList) {
                    friend in Text(friend.name)
                }
            }
            
        }
    }
}

#Preview {
    FriendsListView()
}
