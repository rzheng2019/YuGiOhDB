//
//  JSONManager.swift
//  YuGiOhDB
//
//  Created by Ricky Zheng on 1/20/23.
//

import Foundation

struct Card: Codable {
    let id: Int
    let name: String
    let type: TypeEnum
    let frameType: FrameType
    let desc: String
    let atk, def, level: Int?
    let race: String
    let attribute: String?
    let archetype: Archetype?
    let cardSets: [CardSet]
    let cardImages: [CardImage]
    let cardPrices: [CardPrice]

    enum CodingKeys: String, CodingKey {
        case id, name, type, frameType, desc, atk, def, level, race, attribute, archetype
        case cardSets = "card_sets"
        case cardImages = "card_images"
        case cardPrices = "card_prices"
    }
    
    static let deck: [Card] = Bundle.main.decode(file: "JadenYukiDeck.json")
    static let sampleCard : Card = deck[0]
}

enum Archetype: String, Codable {
    case elementalHERO = "Elemental HERO"
    case kuriboh = "Kuriboh"
}

struct CardImage: Codable {
    let id: Int
    let imageURL, imageURLSmall, imageURLCropped: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
        case imageURLCropped = "image_url_cropped"
    }
}

struct CardPrice: Codable {
    let cardmarketPrice, tcgplayerPrice, ebayPrice, amazonPrice: String
    let coolstuffincPrice: String

    enum CodingKeys: String, CodingKey {
        case cardmarketPrice = "cardmarket_price"
        case tcgplayerPrice = "tcgplayer_price"
        case ebayPrice = "ebay_price"
        case amazonPrice = "amazon_price"
        case coolstuffincPrice = "coolstuffinc_price"
    }
}

struct CardSet: Codable {
    let setName, setCode: String
    let setRarity: SetRarity
    let setRarityCode: SetRarityCode
    let setPrice: String

    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setRarityCode = "set_rarity_code"
        case setPrice = "set_price"
    }
}

enum SetRarity: String, Codable {
    case common = "Common"
    case duelTerminalNormalParallelRare = "Duel Terminal Normal Parallel Rare"
    case duelTerminalUltraParallelRare = "Duel Terminal Ultra Parallel Rare"
    case mosaicRare = "Mosaic Rare"
    case normalParallelRare = "Normal Parallel Rare"
    case premiumGoldRare = "Premium Gold Rare"
    case prismaticSecretRare = "Prismatic Secret Rare"
    case rare = "Rare"
    case secretRare = "Secret Rare"
    case shatterfoilRare = "Shatterfoil Rare"
    case superRare = "Super Rare"
    case ultimateRare = "Ultimate Rare"
    case ultraRare = "Ultra Rare"
}

enum SetRarityCode: String, Codable {
    case c = "(C)"
    case dnpr = "(DNPR)"
    case dupr = "(DUPR)"
    case empty = ""
    case msr = "(MSR)"
    case pScR = "(PScR)"
    case pg = "(PG)"
    case r = "(R)"
    case scR = "(ScR)"
    case shr = "(SHR)"
    case sr = "(SR)"
    case ur = "(UR)"
    case utR = "(UtR)"
}

enum FrameType: String, Codable {
    case effect = "effect"
    case fusion = "fusion"
    case normal = "normal"
    case spell = "spell"
    case trap = "trap"
}

enum TypeEnum: String, Codable {
    case effectMonster = "Effect Monster"
    case fusionMonster = "Fusion Monster"
    case normalMonster = "Normal Monster"
    case spellCard = "Spell Card"
    case trapCard = "Trap Card"
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        // Try to load data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project")
        }
        // Reads data loaded
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project")
        }
        
        return loadedData
    }
}
