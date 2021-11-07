//
//  ContentView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import ShazamKit
import SwiftUI

struct ContentView: View {
    
    @State var selection = 0
    let shadeSound = Sound()
    
    var body: some View {
        TabView(selection: $selection){
            ShadeButtonView()
            .tag(0)
            .tabItem {
                VStack {
                    Image(systemName: "s.circle")
                    Text("Shade")
                }
            }
            JournalView()
            .tag(1)
            .tabItem {
                VStack {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Journal")
                }
            }
            JournalEntryView()
            .tag(2)
            .tabItem {
                VStack {
                    Image(systemName: "square.and.pencil")
                    Text("Journal Entry")
                }
            }
        }
        .accentColor(.pink )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}