//
//  AppModel.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
  
struct Furniture : Identifiable {
    var id : Int
    var title : String
    var imageName : String
    var rating: Int
}
  
var popular = [Furniture(id: 0, title: "Pea Swivel ", imageName: "1", rating: 4),
                   Furniture(id: 1, title: "Adelie Accent Chair", imageName: "2", rating: 3),
                   Furniture(id: 2, title: "Asha II Accent Chair", imageName: "3", rating: 5),
                   Furniture(id: 3, title: "Jenpeg Center Table", imageName: "4", rating: 4)]
 
var best = [Furniture(id: 0, title: "Cologne Sofabed", imageName: "5", rating: 3),
                   Furniture(id: 1, title: "Cleve Sofabed", imageName: "6", rating: 4),
                   Furniture(id: 2, title: "Cleve Sofabed", imageName: "7", rating: 5),
                   Furniture(id: 3, title: "Ivy Dining Chair", imageName: "4", rating: 2)]

