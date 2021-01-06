//
//  State.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/20/20.
//

import SwiftUI
import Foundation
import Combine


class SidebarState: ObservableObject {
    public static let shared = SidebarState()
    @Published var sidebarSelection: String? = DefaultSidebarItems.cards.rawValue

    
    enum DefaultSidebarItems: String, CaseIterable {
        case today, home, cards, stats
        
        func icon() -> String {
            switch self {
            case .today: return "sun.max"
            case .home: return "house.fill"
            case .cards: return "rectangle.grid.3x2"
            case .stats: return "chart.bar"
            }
        }
        
        func color() -> Color {
            switch self {
            case .today: return .yellow
            case .home: return .blue
            case .cards: return .orange
            case .stats: return .green
            }
        }
        
        
        

        
    }
    
    
    private init() {
        sidebarSelection = DefaultSidebarItems.today.rawValue
    }

}
