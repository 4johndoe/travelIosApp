//
//  RestaurantDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 05.01.2022.
//

import SwiftUI
import Kingfisher

struct RestaurantDetails: Decodable {
    let description: String
    let popularDishes: [Dish]
}

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}

class RestaurantDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var details: RestaurantDetails?
    
    init() {
        // fetch my NESTED JSON here
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // handle your erors properly
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
            }
            
        }.resume()
    }
}

struct RestaurantDetailsView: View {
    
    @ObservedObject var vm = RestaurantDetailsViewModel()
    
    let restaurant: Restaurant
    
    var body: some View {

        ScrollView {
            
            ZStack (alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                        }
                    }
                    
                    Spacer()
                    
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
            }
            
            VStack(alignment: .leading) {
                
                Text("Location & Description")
                    .font(.system(size: 16, weight: .bold))
                
                Text("Tokyo, Japan")
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }
                
                Text(vm.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }.padding()
            
            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) {dish in
                        VStack (alignment: .leading) {
                            KFImage(URL(string: dish.photo))
//                            Image("tapas")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .shadow(radius: 2)
                                .padding(.vertical, 2)
                            
                            Text(dish.name)
                                .font(.system(size: 14, weight: .bold))
                            Text("\(dish.numPhotos) photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                }.padding(.horizontal)
            }
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
