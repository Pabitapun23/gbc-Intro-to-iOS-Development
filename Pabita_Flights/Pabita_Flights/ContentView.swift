//
//  ContentView.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        
            Text("Flight Reservation System")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            
            TabView {
                FlightReservationEntryFormScreen()
                    .tabItem {
                        Image(systemName: "plus.app")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                        Text("Add Reservation")
                    }
                
                ReservationHistoryScreen()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                        Text("History")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
