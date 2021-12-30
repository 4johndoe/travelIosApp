//
//  DiscoveryCategoriesView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 28.12.2021.
//

import SwiftUI

struct DiscoveryCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Nature", imageName: "leaf.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach (categories, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack (spacing: 4) {
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(red: 0.983, green: 0.631, blue: 0.213))
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
        //                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }.frame(width: 68)
                        })
                }
            }.padding(.horizontal)
        }
    }
}

//
class SomeObservableObjectForUserInterface: ObservableObject {
    
    @Published var isLoading = true
    
    init () {
        // network code here
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
        }
    }
    
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = SomeObservableObjectForUserInterface()
    
    var body: some View {
        
        ZStack {
            
            if vm.isLoading {
                Text("still loading")
            } else {
                
                ScrollView {
                    
                    ForEach(0..<5, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0){
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Demo123456")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }.asTile()
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoveryCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
//        DiscoveryCategoriesView()
    }
}
