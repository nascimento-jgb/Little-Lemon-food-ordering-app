//
//  MenuItem.swift
//  MyApp
//
//  Created by Joao Nascimento on 2.8.2023.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let itemDescription: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
            case id, title, price, image, category
            case itemDescription = "description"
        }
}
