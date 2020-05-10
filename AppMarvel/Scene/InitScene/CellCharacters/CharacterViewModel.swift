//
//  CharacterViewModel.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol CharacterViewModelProtocol: class {
    func show(name: String, description: String, image:Data?)
}

struct CharacterViewModel {
    let character: CharacteresMarvel
    weak var view: CharacterViewModelProtocol?
    
    mutating func update() {
        view?.show(name: self.character.name, description: self.character.description, image: self.character.image)
    }
}
