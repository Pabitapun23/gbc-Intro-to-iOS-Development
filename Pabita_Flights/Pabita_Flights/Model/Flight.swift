//
//  Flight.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import Foundation

struct Flight : Hashable, Identifiable {
    var id: UUID = UUID()
    var flightNumber: String
    var departureCity: String
    var arrivalCity: String
    var distance: Double
    var airlineCarrier: String
    
    // computed property for flight price
    var price: Double {
        return (100 + (distance * 0.12))
    }
    
    init(flightNumber: String, departureCity: String, arrivalCity: String, distance: Double, airlineCarrier: String) {
        self.flightNumber = flightNumber
        self.departureCity = departureCity
        self.arrivalCity = arrivalCity
        self.distance = distance
        self.airlineCarrier = airlineCarrier
    }
    
}
