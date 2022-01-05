//
//  RestaurantDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 05.01.2022.
//

import SwiftUI

struct RestaurantDetailsView: View {
    var body: some View {
        ScrollView {
            Text("Details")
        }.navigationTitle("Restaurant Details")
            .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}
    
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView()
        }
    }
}
