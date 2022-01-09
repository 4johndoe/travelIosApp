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
            
            VStack(spacing: 16) {
                
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(user.name)
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 12, weight: .regular))
                
                Text("YouTuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack (spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    
                    Spacer()
                        .frame(width: 0.5, height: 10)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("2,112")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                
                HStack (spacing: 12) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(Color(.white))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    })
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(Color(.black))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })
                }
                .font(.system(size: 14, weight: .semibold))
                
                ForEach(0..<10, id: \.self) { num in
                    HStack {
                        Spacer()
                    }
                        .frame(height: 200)
                        .background(Color(white: 0.8))
                        .cornerRadius(12)
                        .shadow(color: .init(white: 0.8), radius: 5, x: 8, y: 4)
                }
                 
            }.padding(.horizontal)

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
