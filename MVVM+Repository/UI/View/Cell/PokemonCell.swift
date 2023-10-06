//
//  PokemonCell.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import UIKit
import Kingfisher

class PokemonCell: UITableViewCell {

    // MARK: - UI Elements
    @IBOutlet weak private var pokemonImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    
    // MARK: - Set Cell
    
    func setCell(name: String, id: Int) {
        pokemonImageView.kf.setImage(with: URL(string: Constants.shared.imageURL + "\(id).png"))
        nameLabel.text = name
    }
}
