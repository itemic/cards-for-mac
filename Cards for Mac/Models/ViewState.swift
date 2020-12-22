//
//  ViewState.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 12/22/20.
//

import Foundation
import Combine
import SwiftUI

class ViewState: ObservableObject {
    public static let shared = ViewState()
    
    @Published var currentViewState: ViewStates = .library
    
    enum ViewStates: String, CaseIterable {
        
        case library, study
    }
    
    private init() {
        currentViewState = .library
    }
    
}
