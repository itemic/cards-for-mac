//
//  Deck.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 1/6/21.
//

import Foundation

class Deck: Identifiable, Equatable, Codable, Hashable, ObservableObject {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.id == rhs.id // temporarily unique names
    }
    
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Deck {
    static var testDeckData: [Deck] {
        [
            Deck(name: "Japanese"),
            Deck(name: "English")
        ]
    }
}
