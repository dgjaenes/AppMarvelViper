//
//  InitRouter.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import UIKit

protocol InitRouterProtocol: RouterProtocol {
    func showDetailCharacter(id: Int)
}

class InitRouter: InitRouterProtocol {
    weak var view: InitViewController?
    
    func showDetailCharacter(id: Int) {
        let secondView = FeaturesProvider.buildDetailFeatureView(characterId: id)

        view?.navigationController?.pushViewController(secondView, animated: true)
    }
}

