//
//  MakePlaylistApp.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import SwiftUI
import CoreData

@main
struct MakePlaylistApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
