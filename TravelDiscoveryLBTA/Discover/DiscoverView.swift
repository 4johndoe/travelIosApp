//
//  DiscoverView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 27.12.2021.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(gray: 0.95, alpha: 1))
}

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.998, green: 0.722, blue: 0.267), Color(red: 0.958, green: 0.493, blue: 0.126)]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView{
                    
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                        
                    }.font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    DiscoveryCategoriesView()
                    
                    VStack {
                        
                        PopularDestinationView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                    }.background(Color.discoverBackground)
                        .cornerRadius(16)
                        .padding(.top, 32)
                }
            }
            
            .navigationTitle("Discover")

        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
