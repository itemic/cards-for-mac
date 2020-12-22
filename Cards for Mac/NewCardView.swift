//
//  NewCardView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/22/20.
//

import SwiftUI

struct NewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State  var sideA: String = ""
    @State  var sideB: String = ""
    @Binding var cards: [Card]
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text("Add New Card").font(.title2).bold()
            Text("Adding new card to <DECK>. Change.")
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
                Button("Add Card") {
                    let c = Card(sideA: sideA, sideB: sideB)
                    cards.append(c)
                    presentationMode.wrappedValue.dismiss()
                }.buttonStyle(NewCardButtonStyle())
                Spacer()
            }

        }
            .frame(minWidth: 300, minHeight: 200)
            .padding([.vertical], 20)
        
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

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView(sideA: "A", sideB: "B", cards: .constant([]))
            .fixedSize(horizontal: true, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    
    }
}
