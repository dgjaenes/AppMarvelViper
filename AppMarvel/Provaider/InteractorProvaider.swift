//
//  InteractorProvaider.swift
//  testDGJ
//
//  Created by David GJ on 30/04/2020.
//  Copyright © 2020 David GJ. All rights reserved.
//

import Foundation

struct InteractorProvaider {
    static func getCharactersInteractor() -> CharacterInteractorProtocol {
        return CharacterInteractorImplement(repository: CharacterReporitoryImplment())
    }
}
