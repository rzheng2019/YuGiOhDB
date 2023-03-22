//
//  ContentView.swift
//  YuGiOhDB
//
//  Created by Ricky Zheng on 1/19/23.
//

import SwiftUI

struct YuGiOhContentView: View {
    private var deck: [Card] = Card.deck
    let cardBackgroundColor : UIColor = #colorLiteral(red: 1, green: 0.9225479824, blue: 0.7845366018, alpha: 1)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(cardBackgroundColor)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Deck (\(deck.count))")
                            .font(.system(size: 40))
                            .bold()
                            .padding(.leading, 20)
                            Spacer()
                    }
                        
                    List {
                        ForEach(deck, id: \.name) { card in
                            NavigationLink(destination: CardDetailView(card: card)) {
                                Text(card.name)
                                    .bold()
                            }
                            .listRowBackground(Color(cardBackgroundColor))
                        }
                    }
                    .listStyle(.plain)
                    .foregroundColor(.black)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        YuGiOhContentView()
    }
}
