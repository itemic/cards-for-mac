//
//  PlaceholderView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct LibraryView : View {
    @ObservedObject var cardsData: CardsData
    
    @State var showAddSheet = false
    @State private var selectedCard: Card? = nil
    var columns: [GridItem] =
        [GridItem(.adaptive(minimum: 200))]
    
    
    @State private var data: Card.Data = Card.Data()
    
    var filterDeck: Deck?
    var filterUncategorized: Bool?
    
    
    var body: some View {
        VStack {
            //        Text(text)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
//                    ForEach(cardsData.cards) { card in
                    ForEach(cardsData.cards.filter {
                        filterUncategorized == true ? $0.deck == nil : filterDeck == nil ? true : $0.deck == filterDeck!
                    }) { card in
                        
                        CardView(card: card)
                            .contextMenu {
                                Button("Edit", action: {
                                    
                                    selectedCard = card
                                    data = card.data
                                })
                                Divider()
                                Text(card.deck?.name ?? "Not in Deck")
                            }
                    
                    }
                }.padding()

           
                
                
                
            }
            
            .sheet(item: $selectedCard) { card in
                EditCardView(cards: $cardsData.cards, decks: $cardsData.decks, card: card, changeMode: .edit)
                
            }
            .background(EmptyView()
                            .sheet(isPresented: $showAddSheet) {
                                EditCardView(cards: $cardsData.cards, decks: $cardsData.decks, card: nil, changeMode: .add)
                            })
            
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add Card") {
                    showAddSheet.toggle()
                }
                
            }
            
        }
        
        
    }
    
    
    
}
