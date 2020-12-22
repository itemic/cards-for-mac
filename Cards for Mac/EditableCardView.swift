//
//  CardView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct EditableCardView: View {
    @Binding var sideA: String
    @Binding var sideB: String
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Side A").font(.caption)
                TextField("Side A", text: $sideA)
                    .textFieldStyle(PlainTextFieldStyle())
                    .multilineTextAlignment(.center)
                Spacer()
                Divider()
                Spacer()
                Text("Side B").font(.caption)
                TextField("Side B", text: $sideB)
                    .textFieldStyle(PlainTextFieldStyle())
                    .multilineTextAlignment(.center)
                Spacer()
            }.font(.system(size: 24))
        }
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 10)

    }
}

struct EditableCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditableCardView(sideA: .constant("A"), sideB: .constant("B"))
    }
}
