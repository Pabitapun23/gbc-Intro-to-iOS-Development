//
//  Pabita_FlightsApp.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import SwiftUI

@main
struct Pabita_FlightsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ReservationList.shared)
        }
    }
}
