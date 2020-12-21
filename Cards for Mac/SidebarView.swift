//
//  ContentView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject private var sidebarState: SidebarState
    @State private var cards = Card.testData
    
    var mockCollections = ["A", "B", "C"]
    var body: some View {
        List(selection: $sidebarState.sidebarSelection) {
            
            ForEach(SidebarState.DefaultSidebarItems.allCases, id: \.self) { item in
                NavigationLink(destination: PlaceholderView(cards: $cards, text: "\(item.rawValue)")) {
                    Label(LocalizedStringKey(item.rawValue.capitalized), systemImage: item.icon()).font(.headline)
                }.listItemTint(item.color()).tag(item.rawValue)
                
            }
            
            
            Divider()
            Text("Collections".uppercased()).font(.headline)
            ForEach(mockCollections, id: \.self) { name in
//                NavigationLink(destination: PlaceholderView(text: name)) {
                    Label("\(name) View", systemImage: "a.circle")
//                }.listItemTint(/*@START_MENU_TOKEN@*/.monochrome/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
