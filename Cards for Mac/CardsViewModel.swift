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
        cards = [
        Card(sideA: "spring", sideB: "春"),
        Card(sideA: "summer", sideB: "夏"),
        Card(sideA: "autumn", sideB: "秋"),
        Card(sideA: "winter", sideB: "冬"),
            Card(sideA: "spring", sideB: "春"),
            Card(sideA: "summer", sideB: "夏"),
            Card(sideA: "autumn", sideB: "秋"),
            Card(sideA: "winter", sideB: "冬"),
            Card(sideA: "spring", sideB: "春"),
            Card(sideA: "summer", sideB: "夏"),
            Card(sideA: "autumn", sideB: "秋"),
            Card(sideA: "winter", sideB: "冬"),
            Card(sideA: "spring", sideB: "春"),
            Card(sideA: "summer", sideB: "夏"),
            Card(sideA: "autumn", sideB: "秋"),
            Card(sideA: "winter", sideB: "冬"),
            Card(sideA: "spring", sideB: "春"),
            Card(sideA: "summer", sideB: "夏"),
            Card(sideA: "autumn", sideB: "秋"),
            Card(sideA: "winter", sideB: "冬"),
        ]
    }
}
