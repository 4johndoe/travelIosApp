//
//  CategoryDetailsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 31.12.2021.
//

import SwiftUI
import Kingfisher

//
class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    
    @Published var errorMessage = ""
    
    init (name: String) {
        // network code here
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            
            // check status code of resp
            if let statusCode = (resp as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status: \(statusCode)"
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                guard let data = data else { return }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
            }
        }.resume()
    }
    
}

struct CategoryDetailsView: View {
    
    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel
    
    init(name: String) {
        print("Loaded CategoryDetails View and making a network request for \(name)")
        self.name = name
        self.vm = .init(name: name)
    }
//    let name: String
    
//    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        
        ZStack {
            
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
                
            } else {
                
                ZStack {
                    
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }
                    
                    ScrollView {
                        
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0){
                                KFImage(URL(string: place.thumbnail)!)
                                    .fade(duration: 0.25)
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }.asTile()
                                .padding()
                        }
                    }
                }
            }
        }
        .navigationBarTitle(name, displayMode: .inline)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CategoryDetailsView(name: "Food")
        }
        
//        DiscoverView()
    }
}
