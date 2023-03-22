//
//  CardDetailView.swift
//  YuGiOhDB
//
//  Created by Ricky Zheng on 1/20/23.
//

import SwiftUI

struct CardDetailView: View {
    let card : Card
    let cardBackgroundColor : UIColor = #colorLiteral(red: 1, green: 0.9225479824, blue: 0.7845366018, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(cardBackgroundColor)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                CardHeaderView(card: card)
                CardInformationView(card: card)
            }
        }
    }
}

struct CardHeaderView : View {
    let card : Card
    
    var body: some View {
        Text(card.name)
            .font(.system(size: 22))
            .fontDesign(.monospaced)
            .bold()
        NavigationLink(destination: ExpandedCardView(card: card)) {
            AsyncImage(url: URL(string: card.cardImages[0].imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 380)
            
        }
    }
}

struct CardInformationView : View {
    let card : Card
    
    var body: some View {
        VStack {
            HStack {
                Text("Description:")
                    .fontDesign(.monospaced)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .bold()
                    .font(.system(size:18))
                Spacer()
            }
            HStack {
                Text("Race: ")
                    .fontWeight(.medium)
                    .bold()
                    .fontDesign(.monospaced)
                    .padding(.bottom, 2)
                Text("[\(card.race)]")
                    .fontDesign(.monospaced)
                Spacer()
            }
            .padding(.bottom, 2)
            HStack {
                Text(card.desc)
                    .fontDesign(.monospaced)
                    .padding(.bottom, 2)
                Spacer()
            }
            .padding(.bottom, 4)
            HStack {
                if let cardAttribute = (card.attribute != nil) ? card.attribute : nil {
                    Text("Attribute: ")
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.system(size: 18))
                    Text(cardAttribute)
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                    Spacer()
                }
            }
            HStack {
                if let cardArchetype = (card.archetype != nil) ? card.archetype : nil {
                    Text("Archetype: ")
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.system(size: 18))
                    Text(cardArchetype.rawValue)
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                    Spacer()
                }
            }
            HStack {
                Text("Type: ")
                    .fontDesign(.monospaced)
                    .padding(.bottom, 2)
                    .bold()
                    .font(.system(size: 18))
                Text(card.type.rawValue)
                    .fontDesign(.monospaced)
                Spacer()
            }
            HStack {
                if let cardLevel = (card.level != nil) ? card.level : nil {
                    Text("Level: ")
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.system(size: 18))
                    Text(String(cardLevel))
                        .fontDesign(.monospaced)
                }
                Spacer()
            }
            HStack {
                if let atkPoints = (card.atk != nil) ? card.atk : nil {
                    Text("ATK/")
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.system(size: 18))
                    Text(String(atkPoints))
                        .fontDesign(.monospaced)
                }
                Spacer()
                if let defPoints = (card.def != nil) ? card.def : nil {
                    Text("DEF/")
                        .fontDesign(.monospaced)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.system(size: 18))
                    Text(String(defPoints))
                        .fontDesign(.monospaced)
                }
                Spacer()
            }
        }
        .frame(width: 350)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: Card.sampleCard)
    }
}
