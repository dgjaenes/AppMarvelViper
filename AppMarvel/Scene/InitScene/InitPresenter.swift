//
//  InitPresenter.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol InitPresenterProtcocol: PresenterProtcocol {
    var interactor: CharacterInteractorProtocol? {get set}
    func cellCharacterTapped(index: Int)
}

class InitPresenter: InitPresenterProtcocol {
    
    weak var view: FirstViewProtocol?
    var router: InitRouterProtocol?
    var interactor: CharacterInteractorProtocol?
    var currentList: [CharacteresMarvel] = [CharacteresMarvel]()
    
    func viewDidLoad(viewProtocol: ViewProtocol) {
        self.view = viewProtocol as? FirstViewProtocol
        view?.showLoading()
        updateCharacters()
    }
    
    func cellCharacterTapped(index: Int) {
        router?.showDetailCharacter(id: currentList[index].id)
    }
    
    private func updateCharacters() {
        
        interactor?.getCharacters( name: nil, completion: { (result) in
            switch result {
            case .success(let responsemarvel):
                self.currentList = responsemarvel.map({CharacteresMarvel(character: $0)})
                self.showCharacers(list: self.currentList)
            case .failure(let error):
                print("Error : \(error)")
                self.showError(error: error.localizedDescription)
            }
            
            self.view?.hideLoading()
        })
    }
    
    private func showCharacers(list: [CharacteresMarvel]) {
        view?.showTableView(list: list.map({CharacterViewModel(character: $0, view: nil)}))
    }
    
    private func showError(error: String) {
        view?.showError(error: error)
    }
}
