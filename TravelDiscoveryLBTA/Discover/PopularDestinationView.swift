//
//  PopularDestinationView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 28.12.2021.
//

import SwiftUI

struct PopularDestinationView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris"),
        .init(name: "Tokio", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "newyork"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destination")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(destinations, id: \.self) { destination in
                        
                        NavigationLink (
                            destination: PopularDestinationDetailsView(destination: destination),
                            label: {
                                PopularDestinationTile(destination: destination)
                                    .padding(.bottom)
                            })
                    }
                }.padding(.horizontal)
            }
            
        }
    }
}

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    
    var body: some View{
        
        ScrollView {
            Text("Paris")
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
//                                .clipped()
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
//        DiscoverView()
//        PopularDestinationView()
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris" ,country: "France", imageName: "eiffel_tower"))
        }
    }
}
