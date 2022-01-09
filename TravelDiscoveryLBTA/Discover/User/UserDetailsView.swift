//
//  UserDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 09.01.2022.
//

import SwiftUI
import Kingfisher

// https://travel.letsbuildthatapp.com/travel_discovery/user?id=0

struct UserDetails: Decodable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}

class UserDetailsViewModel: ObservableObject {
    
    @Published var userDetails: UserDetails?
    
    init() {
        // network code
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=0") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }

                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("Decoding failed for UserDetails:", jsonError)
                }
            }
            
        }.resume()
    }
}


struct UserDetailsView: View {
    
    @ObservedObject var vm = UserDetailsViewModel()
    
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
                
                ForEach(vm.userDetails?.posts ?? [], id: \.self) { post in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                
                                Text("Here is my post title")
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Text("500k views")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.gray)
                            }
                        }.padding(.horizontal, 8)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                                Text("#Traveling")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(white: 0.9))
                                    .cornerRadius(20)
                            }
                        }
                    }
                        .background(Color(white: 1))
                        .cornerRadius(12)
                        .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
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
