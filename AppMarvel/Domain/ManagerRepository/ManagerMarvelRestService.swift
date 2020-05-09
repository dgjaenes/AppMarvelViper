//
//  ManagerMarvelRestService.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Alamofire

class ManagerMarvelRestService {
    
    static let urlString = "http://gateway.marvel.com/v1/public/"
    
    static func executeRequest<T: Codable>(parameters: [String: Any]?, paht: String, method: HTTPMethod, completion: @escaping (Result<T, Error>) -> ()) {
        
        let request = AF.request("\(urlString)\(paht)", method: method, parameters: parameters)
        
        request.responseJSON(completionHandler: { response in
           
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let tr = try decoder.decode(T.self, from: data)
                    completion(.success(tr))
                } catch let error {
                    completion(.failure(error))
                }
            } else {
                    if let error = response.error {
                    completion(.failure(error))
                    }
                }
            })
    }
}
