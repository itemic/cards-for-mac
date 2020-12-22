//
//  NewCardView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/22/20.
//

import SwiftUI

struct EditCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State  var sideA: String = ""
    @State  var sideB: String = ""
    @Binding var cards: [Card]
    let index: Int
//     var card: Card
//    @State var data: Card.Data
    
    init(cards: Binding<[Card]>, index: Int) {
        self._cards = cards
        self.index = index
        
        let card: Card = cards.wrappedValue[index]
        
        self._sideA = State(initialValue: card.sideA)
        self._sideB = State(initialValue: card.sideB)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
//                Text("Edit Card \(index)").font(.title2).bold()
            Text("Updating card.")
            }
            HStack {
                Spacer()
                EditableCardView(sideA: $sideA, sideB: $sideB)
                Spacer()
            }
            .padding()
            .background(Color.secondary)
            
            
            HStack(spacing: 0) {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }.buttonStyle(NewCardButtonStyle())
                Spacer()
                Button("Save changes") {
                    let c = Card(sideA: sideA, sideB: sideB)
                    cards[index] = c
                    presentationMode.wrappedValue.dismiss()
                }.buttonStyle(NewCardButtonStyle())
                Spacer()
            }

        }
            .frame(minWidth: 300, minHeight: 200)
            .padding([.vertical], 20)
        
    }
    

}

