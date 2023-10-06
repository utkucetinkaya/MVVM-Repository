//
//  PokemonListViewModel.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation

// MARK: - PokemonListResponseProtocol
protocol PokemonListResponseProtocol: AnyObject {
    func pokemonListFetchSuccess(pokemonList: [Pokemon])
    func pokemonListFetchFail(error: String)
}

class PokemonListViewModel {
    
    // MARK: - Properties
    private let repository = PokemonRepository()
    weak var delegate: PokemonListResponseProtocol?

    // MARK: - Fetch All Pokemon
    func fetchAllPokemon() {
        repository.fetchAllPokemon { [weak self] result in
            switch result {
            case .success(let pokemonList):
                self?.delegate?.pokemonListFetchSuccess(pokemonList: pokemonList)
            case .failure(let error):
                self?.delegate?.pokemonListFetchFail(error: error.localizedDescription)
            }
        }
    }
}
