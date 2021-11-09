//
//  JournalEntryView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 07/11/2021.
//

import SwiftUI
import CoreData

struct JournalEntryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var id: UUID = UUID()
    @State var textEntry: String = ""
    @State var dateEntry: Date = Date.now
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            DatePicker(selection: $dateEntry, label: { Text("Date ") })
            TextField("Today I went..", text: $textEntry)
           
            Button(action: {
               
                guard self.textEntry != "" else {return}
                
                let newEntry = JournalEntry(context: viewContext)
                
                newEntry.textEntry = self.textEntry
                newEntry.dateEntry = self.dateEntry
                
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

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView()
    }
}
