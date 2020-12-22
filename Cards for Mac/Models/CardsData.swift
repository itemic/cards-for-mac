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
            print("w")
            self.objectWillChange.send()
        }
    }
    
    func load() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            DispatchQueue.main.async {
                self?.cards = Card.testData
                print("this is running")
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
