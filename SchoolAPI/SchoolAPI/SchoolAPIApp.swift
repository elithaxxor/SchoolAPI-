//
//  SchoolAPIApp.swift
//  SchoolAPI
//
//  Created by Adel Al-Aali on 2/11/23.
//

import SwiftUI

@main
struct SchoolAPIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
