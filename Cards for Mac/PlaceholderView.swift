//
//  PlaceholderView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct PlaceholderView : View {
    @Binding var cards: [Card]
    
    @State var showEditSheet = false
    @State private var selectedCard: Card? = nil
    var columns: [GridItem] =
        [GridItem(.adaptive(minimum: 200))]
    var text: String
    
    @State private var data: Card.Data = Card.Data()
    
    
    var body: some View {
        VStack {
//        Text(text)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(cards) { card in
                        CardView(card: card)
                            .contextMenu {
                                Button("Details", action: {
                                        selectedCard = card
                                        data = card.data
                                })
                                Button("Print", action: {
                                    print(card.id)
                                    print(card.sideA)
                                })
                            }
                    }
                    

                }.padding()
                    
            }
        
        }.sheet(item: $selectedCard) { card in
            CardDetailView(card: binding(for: card), cardData: $data)
        }
    }
    
    private func binding(for card: Card) -> Binding<Card> {
        
        guard let cardIndex = cards.firstIndex(where: {$0 == card}) else {
            fatalError("No card")
        }
            
        return $cards[cardIndex]
    }
    
    
}
