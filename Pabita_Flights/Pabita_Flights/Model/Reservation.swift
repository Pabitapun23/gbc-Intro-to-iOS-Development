//
//  Reservation.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import Foundation

class Reservation: ObservableObject, Identifiable {
    var customerName: String
    var passportNumber: String
    var flight: Flight
    var departureDate: Date
    @Published var isConfirmed = false
    
    // computed property for booking number
    var bookingNumber: String {
        // calling func that generates bookingNumber of 5 characters long
        return ("\(generateBookingNumber(5))")
    }
    
    // function to generate bookingNumber from random alphabets and Numbers
    func generateBookingNumber(_ length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
       return randomString
    }
    
    init(customerName: String, passportNumber: String, flight: Flight, departureDate: Date) {
        self.customerName = customerName
        self.passportNumber = passportNumber
        self.flight = flight
        self.departureDate = departureDate
    }

}
