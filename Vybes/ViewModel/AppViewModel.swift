//
//  AppViewModel.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI

class ProducttViewModel : ObservableObject {
    
    @Published var productsLists : Products = []
    @Published var isloading : Bool = true
    init() {
        getPlanetData()
    }
    
    func getPlanetData() {
        
        URLSession.fetch(request: URLRequest.getProducts(), completion: { resp in
            switch resp {
                
            case .success(let result):
                
                if let data = result.data(using: .utf8){
                    do {
                        let decodedResponse = try JSONDecoder().decode(Products.self, from: data)
                        DispatchQueue.main.async {
                            self.productsLists = decodedResponse
                            self.isloading = false
                        }
                    } catch let jsonError as NSError {
                        print("JSON decode failed: \(jsonError.localizedDescription)")
                    }
                    return
                }
                
            case .failure(_):
                print("Error")
                
            }
        })
    }
}
