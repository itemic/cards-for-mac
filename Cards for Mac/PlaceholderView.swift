//
//  PlaceholderView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct PlaceholderView : View {
    @ObservedObject var cardsData: CardsData
    
    @State var showAddSheet = false
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
                    
                    ForEach(cardsData.cards) { card in
                        
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
                Button("Add card") {
                    showAddSheet.toggle()
//                    let newCard = Card(sideA: "", sideB: "")
//                    cards.append(newCard)
//                    selectedCard = newCard
                }
                
                
            }
            .popover(isPresented: $showAddSheet) {
                NewCardView(cards: $cardsData.cards)
            }
            .sheet(item: $selectedCard) { card in
                EditCardView(cards: $cardsData.cards, index: indexOf(card))

            }
            
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add Card") {
                    showAddSheet.toggle()
                }
                
            }
            
        }
        
        
    }
    
//    private func binding(for card: Card) -> Binding<Card> {
//
//        guard let cardIndex = cardsData.cards.firstIndex(where: {$0 == card}) else {
//            fatalError("No card")
//        }
//
//        return cardsData.$cards[cardIndex]
//    }
    
    private func indexOf(_ card: Card) -> Int {
        guard let cardIndex = cardsData.cards.firstIndex(where: {$0 == card}) else {
        fatalError("No card")
    }
    
    return cardIndex
    }
    
    
}
