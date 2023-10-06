//
//  PokemonRepository.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation

class PokemonRepository {
    
    // MARK: - Properties
    private let networkManager = NetworkManager()
    
    // MARK: - Fetch All Pokemon
    func fetchAllPokemon(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        networkManager.request(router: .getPokemonList) { (result: Result<PokemonListModel, Error>) in
            switch result {
            case .success(let pokemonListModel):
                completion(.success(pokemonListModel.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
