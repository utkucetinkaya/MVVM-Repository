//
//  ApodModel.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation

// MARK: - PokemonList
struct PokemonListModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String
}
