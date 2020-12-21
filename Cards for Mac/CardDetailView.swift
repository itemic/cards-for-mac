//
//  CardDetailView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/21/20.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var card: Card
    @Binding var cardData: Card.Data
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Spacer()
                        Text("Side A - \(card.sideA)").font(.caption)
                        
                        TextField("Tap to add Side A", text: $cardData.sideA).font(.system(size: 24)).multilineTextAlignment(.center)
                        Spacer()
                        Divider()
                        Spacer()
                        Text("Side B - \(card.sideB)").font(.caption)
                        TextField("Tap to add Side B", text: $cardData.sideB).font(.system(size: 24)).multilineTextAlignment(.center)
                        Spacer()
                    }.padding()
                    .frame(width: 300, height: 300)
//                        .background(LinearGradient(gradient: Gradient(colors:  [Color(UIColor.systemGray6), Color(UIColor.systemGray5)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 10)
                    Spacer()
                }.padding(30)
                
                Button("Text") {
//                        card.sideB = sideB
                    card.update(from: cardData)
                    
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
        CardDetailView(card: .constant(Card.testData[1]), cardData: .constant(Card.testData[1].data))
                .scaledToFit()
//        }
    }
}
