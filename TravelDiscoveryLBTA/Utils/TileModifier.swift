//
//  TileModifier.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 29.12.2021.
//

import SwiftUI

extension View {
    
    func asTile() -> some View {
        
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color("tileBackground"))
            .cornerRadius(5)
            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
    }
}
