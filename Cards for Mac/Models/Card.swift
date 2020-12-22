//
//  Model.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import Foundation

struct Card: Identifiable, Equatable, Codable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: UUID
    var sideA: String
    var sideB: String
    
    init(id: UUID = UUID(), sideA: String, sideB: String) {
        self.id = id
        self.sideA = sideA
        self.sideB = sideB
    }
}

extension Card {
    static var testData: [Card] {
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
    
    mutating func update(from data: Data) {
        sideA = data.sideA
        sideB = data.sideB
    }
}
