//
//  CharacteresMarvel.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

struct CharacteresMarvel {
    let id: Int
    let name, description: String
    let image: Data?
    let comics: Comics
    
    init(character : CharacterDO) {
        self.id = character.id
        self.name = character.name
        self.description = character.description
        self.image = character.image
        self.comics = character.comics
    }
}
