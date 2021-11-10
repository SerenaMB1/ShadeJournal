//
//  JournalEntryNewView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 10/11/2021.
//

import SwiftUI
import CoreData

struct JournalEntryNewView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var id: UUID = UUID()
    @State var textEntryView: String = ""
    @State var dateEntryView: Date = Date.now
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            DatePicker(selection: $dateEntryView, label: { Text("Date ") })
            TextField("What did you do?.", text: $textEntryView)
            Button(action: {
                guard self.textEntryView != "" else {return}
                
                let entry = JournalEntry(context: viewContext)
                entry.textEntry = textEntryView
                entry.dateEntry = dateEntryView
                
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
        .onAppear(perform: { dateEntryView = Date.now
            textEntryView = ""})
    }
}


//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
