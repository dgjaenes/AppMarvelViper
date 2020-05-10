//
//  InitPresenterStub.swift
//  AppMarvelTests
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

@testable import AppMarvel

class InitRouterStub: InitRouterProtocol {
    
    var executed = ""
    
    func showDetailCharacter(id: Int) {
        executed = "10"
    }
}

class CharacterInteractorStub: CharacterInteractorProtocol {
    
    let charaterDO = CharacterDO(id: 10, name: "TestMarvel", description: "", modified: "", resourceURI: "", urls: [], thumbnail: Image(path: "", ImageExtension: ""), image: nil, comics: Comics(available: 1, returned: 1, collectionURI: "", items: []), stories: Stories(available: 1, returned: 1, collectionURI: "", items: []), events: Comics(available: 1, returned: 1, collectionURI: "", items: []), series: Comics(available: 1, returned: 1, collectionURI: "", items: []))
    
    func getCharacters(name: String?, completion: @escaping (Result<[CharacterDO], Error>) -> ()) {
        completion(.success([charaterDO]))
    }
    
    func getDetailCharacter(id: Int, completion: @escaping (Result<CharacterDO, Error>) -> ()) {
        
        completion(.success(charaterDO))
    }
}
