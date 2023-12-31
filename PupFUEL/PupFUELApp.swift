//
//  PupFUELApp.swift
//  PupFUEL
//
//  Created by Apple on 04.07.2023.
//

import SwiftUI

@main
struct PupFUELApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
