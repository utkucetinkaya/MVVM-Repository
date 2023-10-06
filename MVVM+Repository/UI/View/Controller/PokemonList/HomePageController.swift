//
//  HomePageController.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import UIKit

class HomePageController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Properties
    private let viewModel = PokemonListViewModel()
    var pokemonList: [Pokemon]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerViewModel()
        registerTableView()
    }
    
    // MARK: - Register ViewModel
    private func registerViewModel() {
        viewModel.delegate = self
        viewModel.fetchAllPokemon()
    }
    
    // MARK: - Register TableView
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PokemonCell.nameOfClass, bundle: nil), forCellReuseIdentifier: PokemonCell.nameOfClass)
    }
}

// MARK: - TableView Delegates
extension HomePageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.nameOfClass, for: indexPath) as? PokemonCell {
            
            cell.setCell(name: pokemonList?[indexPath.row].name ?? "", id: indexPath.row + 1)
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - Fetch Pokemon Response Protocol
extension HomePageController: PokemonListResponseProtocol {
    func pokemonListFetchSuccess(pokemonList: [Pokemon]) {
        self.pokemonList = pokemonList
        tableView.reloadData()
    }
    
    func pokemonListFetchFail(error: String) {
        print(error)
    }
}
