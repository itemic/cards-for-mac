//
//  CardView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text(card.sideA)
                Spacer()
                Divider()
                Spacer()
                Text(card.sideB)
                Spacer()
            }.font(.system(size: 24))
        }
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 10)

    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
