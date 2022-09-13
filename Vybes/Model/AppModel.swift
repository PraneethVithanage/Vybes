//
//  AppModel.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
import Foundation

// MARK: - Product
struct Product: Codable {
    let id, title, price: String
    let rating: Double
    let productDescription: String
    let images: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, rating
        case productDescription = "description"
        case images
    }
}

typealias Products = [Product]
