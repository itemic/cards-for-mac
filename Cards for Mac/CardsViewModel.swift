//
//  CardsViewModel.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI
import Combine

class CardsViewModel: ObservableObject {
    @Published var cards: [Card]
    init() {
        cards = []
    }

}
