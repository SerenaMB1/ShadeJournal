//
//  JournalEntry+CoreDataProperties.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 08/11/2021.
//
//

import Foundation
import CoreData

extension JournalEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }
    @NSManaged public var textEntry: String
    @NSManaged public var dateEntry: Date
}

extension JournalEntry: Identifiable {
    
    static var newFetchRequest: NSFetchRequest<JournalEntry> {
    let request: NSFetchRequest<JournalEntry> = JournalEntry.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "dateEntry", ascending: true)]
return request
    }
}
