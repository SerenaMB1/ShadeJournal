//
//  JournalView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import SwiftUI
import CoreData

struct JournalView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(fetchRequest: JournalEntry.newFetchRequest)

    var entries: FetchedResults<JournalEntry>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entries) { entry in
                    HStack {
                          VStack(alignment: .leading) {
                              NavigationLink( "\(entry.textEntry) ", destination: JournalEntryEditView(entry: entry))
                                    .font(.headline)
                                Text("\(entry.dateEntry) - Date" )
                                  .font(.subheadline)
                            }
                    }
                    .frame(height: 50)
                }
                .onDelete { indexSet in
                            for index in indexSet {
                                viewContext.delete(entries[index])
                            }
                            do {
                                try viewContext.save()
                            } catch {
                                print("Not deleted")
                                print(error.localizedDescription)
                            }
                        }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("Journal")
        }
    }
}


struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}
