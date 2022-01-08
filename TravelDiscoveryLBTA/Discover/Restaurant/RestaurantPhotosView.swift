//
//  RestaurantPhotosView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 08.01.2022.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: proxy.size.width / 3, maximum: 300), spacing: 0),
                    ],
                    spacing: 4, content: {
                        
                        ForEach(0..<15, id: \.self) { num in
                            Image("tapas")
                                .resizable()
                                .scaledToFill()
    //                        Text("Placeholder")
    //                            .padding()
    //                            .background(.red)
                        }
                    })
            }.navigationBarTitle("All Photos", displayMode: .inline)
        }
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
//            .previewLayout(.fixed(width: 800, height: 400))
    }
}
