//
//  ReservationDetailsScreen.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import SwiftUI

struct ReservationDetailsScreen: View {
    var reservation: Reservation
    
    // DateFormatter for formatting the departure date
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long 
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Reservation Detail")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10.0)
            
            Grid(alignment: .leading, verticalSpacing: 10) {
                GridRow {
                    Text("Customer Name:")
                        .fontWeight(.bold)
                        
                    Text("\(reservation.customerName)")
                }
                GridRow {
                    Text("Passport Number:")
                        .fontWeight(.bold)
                    Text("\(reservation.passportNumber)")
                }
                GridRow {
                    
                    Text("Departure Date:")
                        .fontWeight(.bold)
                    Text(dateFormatter.string(from: reservation.departureDate))
                    
                }
                GridRow {
                    Text("Flight Number:")
                        .fontWeight(.bold)
                    Text("\(reservation.flight.flightNumber)")
                }
                GridRow {
                    Text("Departure Airport:")
                        .fontWeight(.bold)
                    Text("\(reservation.flight.departureCity)")
                }
                GridRow {
                    Text("Arrival Airport:")
                        .fontWeight(.bold)
                    Text("\(reservation.flight.arrivalCity)")
                }
                GridRow {
                    Text("Total Price:")
                        .fontWeight(.bold)
                    Text("$\(reservation.flight.price, specifier: "%.2f")")
                }
                GridRow {
                    Text("Reservation Booking Number:")
                        .fontWeight(.bold)
                    Text("\(reservation.bookingNumber)")
                }
                
                Spacer()
            } // Grid
        } // VStack
        
    } // body
}

#Preview {
    ReservationDetailsScreen(reservation: Reservation(customerName: "user", passportNumber: "ABC123", flight: Flight(flightNumber: "abc123", departureCity: "MON", arrivalCity: "TUE", distance: 10.0, airlineCarrier: "adsf"), departureDate: Date()))
    
}
