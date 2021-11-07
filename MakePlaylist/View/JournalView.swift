//
//  JournalView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import SwiftUI

let journalEntries = ["Today", "When", "Before", "After"]

struct JournalView: View {
    var body: some View {
        List {
//            ForEach(journalEntries, id:\.self) { journalEntriesTitles in
            Text("wwo")
//                HStack {
//                    Image(systemName: "calendar")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .cornerRadius(5)
//                        .shadow(radius: 2)
//
//                    VStack(alignment: .leading) {
////                        Text(journalEntriesTitles)
//                        Text("Hello")
//                            .font(.headline)
//                    }
//                    Spacer()
//                    Button(action: {
//                        print("Add Entry")
//                    }) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.pink)
//                    }
//                }
//            }
//            .accentColor(.pink)
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
