//
//  DetailRouter.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol DetailRouterProtocol: RouterProtocol {
}

class DetailRouter: DetailRouterProtocol {
    weak var detailView: DetailViewController?
}

