//
//  MenuItem.swift
//  MyApp
//
//  Created by Joao Nascimento on 2.8.2023.
//

import Foundation

struct MenuItem: Decodable {
    let id: UUID
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
