//
//  ExpandedCardView.swift
//  YuGiOhDB
//
//  Created by Ricky Zheng on 1/20/23.
//

import SwiftUI

struct ExpandedCardView: View {
    
    let deck: [Card] = Card.deck
    let card : Card
    let cardBackgroundColor : UIColor = #colorLiteral(red: 1, green: 0.9225479824, blue: 0.7845366018, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(cardBackgroundColor)
                .ignoresSafeArea()
            ScrollView {
                VStack (spacing: 50){
                    ForEach(card.cardImages, id: \.id) { image in
                        AsyncImage(url: URL(string: image.imageURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 360, height: 600)
                    }
                }
            }
        }
    }
}

struct ExpandedCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedCardView(card: Card.sampleCard)
    }
}

