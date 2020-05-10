//
//  CharacterInteractorImplement.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

class CharacterInteractorImplement: CharacterInteractorProtocol {
    
    var repository: CharacterReporitoryProtocol
    
    init(repository: CharacterReporitoryProtocol) {
        self.repository = repository
    }
    
    func getCharacters(name: String?, completion: @escaping (Result<[CharacterDO], Error>) -> ()) {
        repository.getCharacters(name: name, completion: { (result) in
            switch result {
            case .success(let response):
                var characters: [CharacterDO] = response.data.results
                characters.enumerated().forEach({ (index, item) in
                    self.getImage(character: &characters[index])
                })
                completion(.success(characters))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        })
    }
    
    func getDetailCharacter(id: Int, completion: @escaping (Result<CharacterDO, Error>) -> ()) {
        repository.getCharactersDetail(id: id, completion: { (result) in
            switch result {
            case .success(let response):
                var character: CharacterDO = response.data.results[0]
                self.getImage(character: &character)
                completion(.success(character))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        })
    }
    
    func getImage(character: inout CharacterDO) {
        if let url = URL(string: "\(character.thumbnail.path).\(character.thumbnail.ImageExtension)") {
                do{
                    let imageData: Data = try Data(contentsOf: url)
                    character.image = imageData
                }catch{
                        print("Unable to load data: \(error)")
                }
        }
    }
}
