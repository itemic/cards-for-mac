//
//  ContentView.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject private var sidebarState: SidebarState
    @ObservedObject var data: CardsData
    
    var mockCollections = ["A", "B", "C"]
    var body: some View {
        List(selection: $sidebarState.sidebarSelection) {
            
            Group {
                NavigationLink(destination: EmptyView()) {
                    Label("Home", systemImage: "house.fill").font(.headline)
                }
                .listItemTint(.blue)
                .tag("home")
                
                NavigationLink(destination: EmptyView()) {
                    Label("Today", systemImage: "sun.max").font(.headline)
                }
                .listItemTint(.yellow)
                .tag("today")
                
                NavigationLink(destination: LibraryView(cardsData: data)) {
                    Label("Cards", systemImage: "rectangle.grid.3x2").font(.headline)
                }
                .listItemTint(.orange)
                .tag("cards")
                
                NavigationLink(destination: EmptyView()) {
                    Label("Stats", systemImage: "chart.bar").font(.headline)
                }
                .listItemTint(.green)
                .tag("stats")
            }
            
            
//            ForEach(SidebarState.DefaultSidebarItems.allCases, id: \.self) { item in
////                NavigationLink(destination: LibraryView(cardsData: data, text: "\(item.rawValue)")) {
//                NavigationLink(destination: LibraryView(cardsData: data, text: "\(item.rawValue)")) {
//                    Label(LocalizedStringKey(item.rawValue.capitalized), systemImage: item.icon()).font(.headline)
//                }.listItemTint(item.color()).tag(item.rawValue)
//
//            }
            
            
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
