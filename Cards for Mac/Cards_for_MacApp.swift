//
//  Cards_for_MacApp.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI



@main
struct Cards_for_MacApp: App {
    // state objects
    @StateObject private var sidebarState = SidebarState.shared
    @StateObject private var viewState = ViewState.shared
    @ObservedObject private var data = CardsData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SidebarView(data: data)
            }
            .onAppear {
                data.load()
            }
            .frame(minWidth: 1000, minHeight: 800)
            .listStyle(SidebarListStyle())
            .navigationTitle("Cards for Mac")
            .navigationSubtitle("\(sidebarState.sidebarSelection?.capitalized ?? "")")
            .environmentObject(sidebarState)
            .environmentObject(viewState)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Switch view") {
                        switch (viewState.currentViewState) {
                        case .library:
                            viewState.currentViewState = .study
                        case .study:
                            viewState.currentViewState = .library
                        }
                    }
                }
            }
        }
        .commands {
            CommandGroup(after: CommandGroupPlacement.sidebar) {
                Button("Toggle Sidebar") {
                    toggleSidebar()
                }.keyboardShortcut("T")
            }
        }
        
    }

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
}
