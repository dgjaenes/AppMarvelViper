//
//  DetailPresenter.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation


protocol DetailPresenterProtcocol: PresenterProtcocol {
    var interactor: CharacterInteractorProtocol? {get set}
}

class DetailPresenter: DetailPresenterProtcocol {
    
    weak var view: DetailViewProtocol?
    weak var router: DetailRouterProtocol?
    var currentCharacterId: Int
    var interactor: CharacterInteractorProtocol?
    
    init(characterId: Int) {
        self.currentCharacterId = characterId
        view?.showLoading()
        updateCharacter()
    }
    
    func viewDidLoad(viewProtocol: ViewProtocol) {
        self.view = viewProtocol as? DetailViewProtocol
        view?.showLoading()
        updateCharacter()
    }
    
    private func updateCharacter() {
        
        interactor?.getDetailCharacter(id: currentCharacterId, completion: { (result) in
            switch result {
                
            case .success(let responseCharacter):
                
                self.view?.update(name: responseCharacter.name, description: responseCharacter.description, comics: responseCharacter.comics.items.count, image: responseCharacter.image)
            case .failure(let error):
                
                print("Error : \(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            
            self.view?.hideLoading()
        })
    }
}
