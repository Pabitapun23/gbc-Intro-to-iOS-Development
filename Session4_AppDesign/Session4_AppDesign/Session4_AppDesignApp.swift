//
//  Session4_AppDesignApp.swift
//  Session4_AppDesign
//
//  Created by Tech on 2024-02-01.
//

import SwiftUI

@main
struct Session4_AppDesignApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase, perform: { currentPhase in
            switch(currentPhase){
            case .active:
                print("app is in ACTIVE state")
            case .inactive:
                print("app is in INACTIVE state")
            case .background:
                print("app is in BACKGROUND state")
            @unknown default:
                print("app is in UNKNOWN state")
            }
        })
    }
}
