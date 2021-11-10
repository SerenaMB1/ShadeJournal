//
//  Persistence.swift
//  CoreData
//
//  Created by Serena Badesha on 08/11/2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    //Storage for Core Data
    let container: NSPersistentContainer

    static var preview: PersistenceController = {
        
        let controller = PersistenceController(inMemory: true)
        
        for _ in 0..<5 {
            let newItem = JournalEntry(context: controller.container.viewContext)
                newItem.textEntry = "Today I went to the beach"
                newItem.dateEntry = Date.now

        }

        return controller
    } ()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MakePlaylist")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        })
    }
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    
    func newEntry() -> JournalEntry {
        
        let entry = JournalEntry(context: container.viewContext)
        entry.textEntry = "I AM A POTATO"
        entry.dateEntry = Date.now
        
        return entry
    }
}
