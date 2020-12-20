//
//  PlaceholderView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct PlaceholderView : View {
    @EnvironmentObject var vm: CardsViewModel
    @State var showEditSheet = false
    
    var columns: [GridItem] =
        [GridItem(.adaptive(minimum: 220))]
    var text: String
    
    
    var body: some View {
        VStack {
//        Text(text)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.cards) {card in
                        CardView(card: card)
                            .sheet(isPresented: $showEditSheet) {
                                CardEditView(card: card, isPresented: self.$showEditSheet).environmentObject(vm)
                            }
                            .contextMenu {
                                Button("Edit", action: {showEditSheet.toggle()})
                                    

                            }
                            
                    }
                }.padding()
            }
        
        }
    }
    
    
}
