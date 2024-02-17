//
//  ReservationList.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import Foundation

class ReservationList: ObservableObject {

    // Singleton instance
    static let shared = ReservationList(reservations: [])
        
    @Published var reservations: [Reservation]
        
    // Private initializer to prevent external instantiation
    private init(reservations: [Reservation]) {
        self.reservations = reservations
    }
}
