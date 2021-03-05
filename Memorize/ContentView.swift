//
//  ContentView.swift
//  Memorize
//
//  Created by melot on 2021/3/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { index in
                HStack {
                    ForEach(0..<4) { index in
                        CardView(faceUp: false)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
        
    }
}


struct CardView: View {
    var faceUp: Bool
    var body: some View {
        ZStack {
            if faceUp {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
