//
//  Model.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import Foundation

class Card: Identifiable, Equatable, Codable, ObservableObject {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: UUID
    var sideA: String
    var sideB: String
    var deck: Deck?
    
    init(id: UUID = UUID(), sideA: String, sideB: String) {
        self.id = id
        self.sideA = sideA
        self.sideB = sideB
        self.deck = nil
    }
}

extension Card {
    static var testCardData: [Card] {
        [
        Card(sideA: "spring", sideB: "春"),
        Card(sideA: "summer", sideB: "夏"),
        Card(sideA: "autumn", sideB: "秋"),
        Card(sideA: "winter", sideB: "冬"),
        Card(sideA: "up", sideB: "うえ"),
        Card(sideA: "down", sideB: "した"),
        Card(sideA: "left", sideB: "ひだり"),
        Card(sideA: "right", sideB: "みぎ"),
      
        ]
    }
}

extension Card {
    struct Data {
        var sideA: String = ""
        var sideB: String = ""
    }
    
    var data: Data {
        return Data(sideA: sideA, sideB: sideB)
    }
    
    func update(from data: Data) {
        sideA = data.sideA
        sideB = data.sideB
    }
}
