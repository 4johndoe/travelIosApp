//
//  RestaurantPhotosView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 08.01.2022.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                ],
                content: {
                    Text("Placeholder")
                        .padding()
                        .background(.red)
                    Text("Placeholder")
                        .padding()
                        .background(.red)
                    Text("Placeholder")
                        .padding()
                        .background(.red)
                    Text("Placeholder")
                        .padding()
                        .background(.red)
                })
        }.navigationBarTitle("All Photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantPhotosView()
    }
}
