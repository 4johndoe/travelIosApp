//
//  DestinationHeaderContainer.swift
//  TravelDiscoveryLBTA
//
//  Created by Bogdan Demchenko on 03.01.2022.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
