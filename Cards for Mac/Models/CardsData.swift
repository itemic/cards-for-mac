//
//  CardsData.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/22/20.
//

import Foundation

class CardsData: ObservableObject {
    @Published var cards: [Card] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    @Published var decks: [Deck] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    func load() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            DispatchQueue.main.async {
                self?.cards = Card.testCardData
                self?.decks = Deck.testDeckData
//                print("this is running")
//                print(self?.cards)
            }
            return
            
            // ignoring json encode/decode for now
        }
    }
    
    func save() {
        // no need yet
    }
}
