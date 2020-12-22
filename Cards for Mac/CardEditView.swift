//
//  CardEditView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct CardEditView: View {
    @State var sideA: String = ""
    @State var sideB: String = ""
    @ObservedObject var card: Card
    @Binding var isPresented: Bool

    
    var body: some View {
        
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Spacer()
                        VStack(alignment: .center, spacing: 0) {
                            Spacer()
                            Text("Side A\(card.sideA)").font(.caption)
                            
                            TextField("Tap to add Side A", text: $sideA).font(.system(size: 24)).multilineTextAlignment(.center)
                            Spacer()
                            Divider()
                            Spacer()
                            Text("Side B").font(.caption)
                            TextField("Tap to add Side B", text: $sideB).font(.system(size: 24)).multilineTextAlignment(.center)
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
                        isPresented.toggle()
                    }
                }
            }
        }
    }
}

//struct CardEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardEditView()
//    }
//}
