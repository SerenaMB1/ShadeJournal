//
//  ShadeButtonView.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import SwiftUI

let shadeSound = Sound()

struct ShadeButtonView: View {
    
    var body: some View {
        GeometryReader { geometry in
            Group {
            VStack(alignment: .center,spacing: 40) {
                HStack{
                    Text("Shade Button")
                        .font(.system(size: 50))
                        .foregroundColor(.pink)
                        .font(.largeTitle)
                }
                
                HStack(alignment: .center){
                    Button(action: {
                        shadeSound.playShadeSound()
                    }) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .padding(0)
                            .frame(width: geometry.size.width - 200, height: geometry.size.width - 200)
                            .accentColor(.pink)
                    }
                }
                HStack {
                    Text("Press button in case of shade!")
                        .frame(width: 300, height: 50)
                        .font(.system(size: 20))
                        .foregroundColor(.pink)
                }
                }
            } .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
        }
    }
}

struct ShadeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ShadeButtonView()
            //.dark 
    }
}
