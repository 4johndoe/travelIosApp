//
//  RestaurantDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 05.01.2022.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            
            VStack {
                
            }
            
            Text("Details")
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}
    
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapas", imageName: "tapas"))
        }
    }
}
