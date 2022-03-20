//
//  ContentView.swift
//  WarGame
//
//  Created by Olivier Marszałkowski on 20/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Card index
    @State private var userCard: Int = 0
    @State private var cpuCard: Int = 0
    //Scores
    @State private var userScore: Int = 0
    @State private var cpuScore: Int = 0
    //card lists
    var allCards: [String] = ["back", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13", "card14"]
    
    private func roll(){
        //Assign int to random number
        let number1: Int = Int.random(in: 1...13)
        let number2: Int = Int.random(in: 1...13)
        //Assign cards
        userCard = number1
        cpuCard = number2
        print("User: \(userCard)")
        print("CPU: \(cpuCard)")
        //Check the winner
        if userCard > cpuCard {
            userScore+=1
        }
        else if cpuCard > userCard{
            cpuScore+=1
        }
    }
    
    private func clearAll(){
        //Reset User
        userScore = 0
        userCard = 0
        //Reset CPU
        cpuScore = 0
        cpuCard = 0
    }
    
    var body: some View {
        ZStack{
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(allCards[userCard])
                    Spacer()
                    Image(allCards[cpuCard])
                    Spacer()
                }
                Spacer()
                VStack {
                    Button(action: {
                        roll()
                    }, label: {Image("dealbutton")})
                    Spacer().frame(width: 0, height: 50, alignment: .center)
                    HStack{
                        Spacer()
                        VStack{
                            Text("YOU")
                                .font(.title)
                                .foregroundColor(Color.orange)
                            Text(String(userScore))
                                .font(.largeTitle)
                                .foregroundColor(Color.orange)
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .foregroundColor(Color.white)
                                .font(.title)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                }
                Spacer()
                Button(action: {
                    clearAll()
                }, label: {Text("Reset").bold()}).disabled(userScore == 0 && cpuScore == 0)
                Spacer().frame(width: 0, height: 50, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13 Pro Max")
    }
}
