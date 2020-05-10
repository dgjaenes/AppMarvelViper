//
//  CharacterReporitoryImplment.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Alamofire

class CharacterReporitoryImplment: CharacterReporitoryProtocol {
    
    static var parametersMarvel = ["ts": "1", "apikey": "596593acfee9dd9dee50fec70e79fdd5", "hash" : "653680c61c9df51c24eda7f2bd53f1bc", "orderBy": "modified"]
    
    func getCharacters(name: String? = nil, completion: @escaping (Result<CharactersResponseDO, Error>) -> ()) {
        let pahtCaracters = "characters"
        var parameters: [String: Any] = CharacterReporitoryImplment.parametersMarvel
        parameters.updateValue("30", forKey: "limit")
        if let name = name {
            parameters.updateValue(name, forKey: "name")
        }
        
        ManagerMarvelRestService.executeRequest(parameters: parameters, paht: pahtCaracters, method: .get , completion: completion)
    }
    
    func getCharactersDetail(id: Int, completion: @escaping (Result<CharactersResponseDO, Error>) -> ()) {
        let pahtCaracters = "characters"
        var parameters: [String: Any] = CharacterReporitoryImplment.parametersMarvel
        parameters.updateValue(String(id), forKey: "id")
        
        ManagerMarvelRestService.executeRequest(parameters: parameters, paht: pahtCaracters, method: .get , completion: completion)
    }
}
