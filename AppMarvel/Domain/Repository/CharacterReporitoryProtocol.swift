//
//  CharacterReporitoryProtocol.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol CharacterReporitoryProtocol {
    func getCharacters(completion: @escaping (Result<CharactersResponseDO, Error>) -> ())
    func getCharactersDetail(id: Int, completion: @escaping (Result<CharactersResponseDO, Error>) -> ())
}

