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
        NavigationView{
            
            VStack(alignment: .leading) {
                
                DatePicker(selection: $dateEntryView, label: { Text("Date ") })
                    .padding(.leading, 5)
                    .padding(.bottom, 30)
                
                TextEditor(text: $textEntryView)
                    .foregroundColor(Color.pink)
                    .font(.custom("HelveticaNeue", size: 20))
                    .lineSpacing(5)
                    .border(Color.pink, width: 2)
                    .keyboardType(.alphabet)
                    .frame(width: 365, height: 350)
                    .padding([.leading], 5)
                    
                
                   // .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
                 
                Button(action: {
                    guard self.textEntryView != "" else {return}
                    let entry = JournalEntry(context: viewContext)
                    entry.textEntry = textEntryView
                    entry.dateEntry = dateEntryView
                    hideKeyboard()
                    do {
                        try viewContext.save()
                        print("Entry saved")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
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
                
                
               //.foregroundColor(.pink)
//                .padding()
//                .border(Color.pink, width: 2)
//                .padding(.leading, 125)
//                .padding(.top, 20)
            }
            .keyboardType(.alphabet)
            .navigationTitle("New Entry")
            .font("Impact")
        }
        .onAppear(perform: { dateEntryView = Date.now
            textEntryView = ""})
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct JournalEntryNewView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryNewView()
        
    }
}
