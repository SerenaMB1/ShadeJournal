//
//  JournalEntryRow.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 07/11/2021.
//

import SwiftUI

//var journal1: Journal(id: 1, title: "Today", text: "Today I went to.. ")

struct JournalRow: View {
    var journal1 = Journal(id: 1, title: "Today", text: "Today I went to.. ")
    var body: some View {
        HStack {
            Text("Hello World")

            Spacer()
        }
    }
}

struct JournalEntryRow_Previews: PreviewProvider {
    static var previews: some View {
        JournalRow()
    }
}
