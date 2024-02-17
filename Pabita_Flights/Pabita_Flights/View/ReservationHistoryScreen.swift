//
//  ReservationHistoryScreen.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import SwiftUI

struct ReservationHistoryScreen: View {
    @EnvironmentObject var reservationList: ReservationList
  
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Reservation History")
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                List {
                    ForEach(reservationList.reservations) { reservation in
                        NavigationLink(destination: ReservationDetailsScreen(reservation: reservation)) {
                            HStack {
                                Text("\(reservation.customerName)")
                                Spacer()
                                Text("Booking ID: \(reservation.bookingNumber)")
                            }
                        }
                    }
                    .onDelete { indexSet in
                        reservationList.reservations.remove(atOffsets: indexSet)
                    }
                } // List
 
                Spacer()
                
            } // VStack
            
        } // NavigationView
        
    } // body
}

#Preview {
    ReservationHistoryScreen()
}
