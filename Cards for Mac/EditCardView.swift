//
//  NewCardView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/22/20.
//

import SwiftUI

enum ChangeMode: CaseIterable {
    case add, edit
}

struct EditCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State  var sideA: String = ""
    @State  var sideB: String = ""
    @Binding var cards: [Card]
    let card: Card
//    let index: Int
    let changeMode: ChangeMode
//     var card: Card
//    @State var data: Card.Data
    
    init(cards: Binding<[Card]>, card: Card?, changeMode: ChangeMode) {
        self._cards = cards
//        self.index = index
        
//        let card: Card = cards.wrappedValue[index]
        self.card = card ?? Card(sideA: "", sideB: "")
        self.changeMode = changeMode
        
        self._sideA = State(initialValue: self.card.sideA)
        self._sideB = State(initialValue: self.card.sideB)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
//                Text("Edit Card \(index)").font(.title2).bold()
                switch (changeMode) {
                case .add:
                    Text("Adding new card")
                case .edit:
                    Text("Editing card")
                }
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
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Button("Save changes") {
                    saveChanges()
                }
                .disabled(sideA.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || sideB.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                Spacer()
            }

        }
            .frame(minWidth: 300, minHeight: 200)
            .padding([.vertical], 20)
        
    }
    
    private func saveChanges() {
        
        let c = Card(sideA: sideA.trimmingCharacters(in: .whitespacesAndNewlines), sideB: sideB.trimmingCharacters(in: .whitespacesAndNewlines))
        
        switch (changeMode) {
        case .add:
            cards.append(c)
        case .edit:
            cards[indexOf(card)] = c
        }
        presentationMode.wrappedValue.dismiss()
    }
    

    private func indexOf(_ card: Card) -> Int {
        guard let cardIndex = cards.firstIndex(where: {$0 == card}) else {
        fatalError("No card")
    }
    
    return cardIndex
    }
}

struct NewCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(minWidth: 80)
            .padding([.vertical], 10)
            .padding([.horizontal], 10)
            .background(Color.yellow)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .foregroundColor(.primary)
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
//            .animation(.spring())
    }
}
