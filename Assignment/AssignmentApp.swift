//
//  AssignmentApp.swift
//  Assignment
//
//  Created by Swayam Rustagi on 01/03/24.
//

import SwiftUI

@main
struct AssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
