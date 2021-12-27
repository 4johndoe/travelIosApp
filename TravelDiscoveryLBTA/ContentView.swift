//
//  ContentView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 27.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView{
                
                ScrollView (.horizontal) {
                    
                    HStack(spacing: 16) {
                        ForEach (0..<15, id: \.self) { num in
                            Spacer()
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .cornerRadius(.infinity)
                        }
                    }
                }
            }.navigationTitle("Discover")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
