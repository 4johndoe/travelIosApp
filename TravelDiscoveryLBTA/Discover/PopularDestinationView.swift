//
//  PopularDestinationView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 28.12.2021.
//

import SwiftUI
import MapKit

struct PopularDestinationView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris", latitude: 48.859565, longitude: 2.353235),
        .init(name: "Tokio", country: "Japan", imageName: "japan", latitude: 48.859565, longitude: 2.353235),
        .init(name: "New York", country: "US", imageName: "newyork", latitude: 48.859565, longitude: 2.353235),
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
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(
            center: .init(latitude: destination.latitude, longitude: destination.longitude),
            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    var body: some View{
        
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            VStack(alignment: .leading){
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                    .padding(.bottom, 2)
                
                HStack {
                    ForEach(0..<5, id: \.self) {num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                
                HStack{ Spacer() }
                
            }.padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Button(action: { isShowingAttractions.toggle() }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractoins")
                        .font(.system(size: 14, weight: .semibold))
                })
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                
            }.padding(.horizontal)
            
//            Map(coordinateRegion: $region)
//                .frame(height: 300)
//
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) {
                attraction in
                MapMarker(
                    coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude),
                    tint: .blue)
            }
            .frame(height: 300)

        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Eiffel Tower", latitude: 48.860288, longitude: 2.337789),
    ]
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name: String
    let latitude, longitude: Double
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
            PopularDestinationDetailsView(destination: .init(name: "Paris" ,country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235  ))
        }
    }
}
