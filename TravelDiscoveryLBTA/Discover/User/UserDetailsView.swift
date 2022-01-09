//
//  UserDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 09.01.2022.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            Image(user.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            Text(user.name)
                .font(.system(size: 14, weight: .semibold))
            
            HStack {
                Text("@amyadams20 •")
                    .font(.system(size: 12, weight: .regular))
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 10, weight: .semibold))
                Text("2541")
            }
//            KFImage(URL(string: user.imageName))
        }.navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UserDetailsView(user: .init(name: "Amy Adams", imageName: "amy"))
        }
    }
}
