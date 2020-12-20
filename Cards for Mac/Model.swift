//
//  Model.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import Foundation

class Card: Identifiable, Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var sideA: String
    var sideB: String
    
    init(sideA: String, sideB: String) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
