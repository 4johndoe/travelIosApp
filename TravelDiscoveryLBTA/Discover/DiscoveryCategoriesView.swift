//
//  DiscoveryCategoriesView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 28.12.2021.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct DiscoveryCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach (categories, id: \.self) { category in
                    NavigationLink(
                        destination:
                            NavigationLazyView(CategoryDetailsView(name: category.name)),
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

struct DiscoveryCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
//        DiscoveryCategoriesView()
    }
}
