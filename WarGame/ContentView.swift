//
//  ContentView.swift
//  WarGame
//
//  Created by Olivier Marszałkowski on 20/03/2022.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        NavigationView {
            ZStack{
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                VStack{
                    Spacer().frame(width: 0, height: 50, alignment: .center)
                    Image("logo")
                    Spacer().frame(width: 0, height: 50, alignment: .center)
                    Text("War Game")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer().frame(width: 0, height: 50, alignment: .center)
                    NavigationLink(destination: GameView()) {
                        Text("Start!")
                            .foregroundColor(.white)
                            .frame(width: 120, height: 50, alignment: .center)
                            .background(Color.teal)
                            .cornerRadius(30)
                           }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13 Pro Max")
    }
}
