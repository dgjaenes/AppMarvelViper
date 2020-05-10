//
//  CharacterInteractorProtocol.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol CharacterInteractorProtocol {
    func getCharacters(name: String?, completion: @escaping (Result<[CharacterDO], Error>) -> ())
    func getDetailCharacter(id: Int, completion: @escaping (Result<CharacterDO, Error>) -> ())
}
