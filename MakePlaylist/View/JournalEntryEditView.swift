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

    var body: some View {
        
        VStack(alignment: .leading) {
            
            DatePicker(selection: $entry.dateEntry, label: { Text("Date ") })
            TextField("What did you do?.", text: $entry.textEntry)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.alphabet)
            
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
