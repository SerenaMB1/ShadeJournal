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
                
                DatePicker(selection: $entry.dateEntry, label: {})
                    .padding(.leading, 5)
                    .padding(.bottom, 30)
                
                TextEditor( text: $entry.textEntry)
                    .foregroundColor(Color.pink)
                    .font(.custom("HelveticaNeue", size: 20))
                    .lineSpacing(5)
                    .border(Color.pink, width: 2)
                    .keyboardType(.alphabet)
                    .frame(width: 365, height: 350)
                    .padding([.leading], 5)
                
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
                    HStack{
                        Image(systemName: "pencil.circle")
                            .font(.title)
                        Text("Save entry")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightPink"), Color("DarkPink")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    
                }

            }
        }
    }

