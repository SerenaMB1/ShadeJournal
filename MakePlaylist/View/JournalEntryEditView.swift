//
//  JournalEntryEditView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 07/11/2021.
//

import SwiftUI
import CoreData

struct JournalEntryEditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var entry: JournalEntry

    // Honestly, the easiest thing to do is this
    // 1. Create a new view called JournalEntryNewView
    // 2. In that view create a new model the way you were doing previously. Use the @State variables to capture the data from the UI, and create a new model the way you did before. Code is in PersistanceController NewEntry if you can't remember
    // 3. Do not used the Observed object in that new view but do leave it in this one.
    // 4. Rename this view to JournalEntryEditView. Anywhere you want to edit the view, you call this instead, passing in the entity in question as a parameter
    // That should get you what you want.
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            DatePicker(selection: $entry.dateEntry, label: { Text("Date ") })
            TextField("What did you do?.", text: $entry.textEntry)
            Button(action: {
                guard self.entry.textEntry != "" else {return}
                
                do {
                    try viewContext.save()
                    print("Entry saved")
                    presentationMode.wrappedValue.dismiss()
                }
                catch {
                    print("Not saved")
                    print(error.localizedDescription)
                }
                
            }) {
                Text("Save entry")
            }
        }
    }
}
