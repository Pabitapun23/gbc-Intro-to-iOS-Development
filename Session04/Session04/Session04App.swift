//
//  Session04App.swift
//  Session04
//
//  Created by Pabita Pun on 2024-02-01.
//

import SwiftUI

@main // launching point of app
struct Session04App: App {
    @Environment(\.scenePhase) var scenePhase
    // scene - 2 scene in 1 screen -> multi windows in a single screen is called scenes
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase, perform: { currentPhase in
            switch(currentPhase) {
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
