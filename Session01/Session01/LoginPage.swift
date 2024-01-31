//
//  LoginPage.swift
//  Session01
//
//  Created by Pabita Pun on 2024-01-29.
//

import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Text("Login Page")
            .font(.title)
            .fontWeight(.bold)
            .lineLimit(nil)
            
        Image("pic")
//            .resizable(capInsets: EdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0))
            .resizable()
            .frame(width: 200.0, height: 250.0)
            .clipShape(Circle())
        HStack {
            Label("Username:", systemImage: "")
                .multilineTextAlignment(.leading)
                .padding(.leading, 30.0)
            TextField("Username", text: $username)
                .padding(.all, 10.0)
        }
        
        HStack {
            Label("Password:", systemImage: "").padding(.leading, 30.0)
            TextField("Password", text: $password)
                .padding(.all, 10.0)
        }.padding(.bottom, 20.0)

        Button("Login"){
            print("Login Button Clicked!")
        }
        .padding(.all, 15.0)
        .frame(width: 90.0, height: 50.0)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
        .border(/*@START_MENU_TOKEN@*/Color.green/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
        
        HStack{
            Text("Don't have an account?")
                .padding(.top, 10.0)
            Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                Text("Sign Up")
                    .padding([.top, .leading], 10.0)
            }
        }
    }
}


#Preview {
    LoginPage()
}
