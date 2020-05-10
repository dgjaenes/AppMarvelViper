//
//  AppMarvelTests.swift
//  AppMarvelTests
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import XCTest
@testable import AppMarvel

class InitPresenterTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitPresenter() {
        let presenter = buildPresenter()
        
        presenter.interactor?.getCharacters(name: nil, completion: { (result) in
            switch result {
            case .success(let responsemarvel):
                XCTAssertEqual(responsemarvel[0].id, 10)
            case .failure(let error):
                XCTFail(error.localizedDescription, file: "InitPresenterTest", line: 35)
            }
            
        })
        
        presenter.interactor?.getDetailCharacter(id: 10, completion: { (result) in
            switch result {
            case .success(let responsemarvel):
                XCTAssertEqual(responsemarvel.name, "TestMarvel")
            case .failure(let error):
                XCTFail(error.localizedDescription, file: "InitPresenterTest", line: 35)
            }
        })
        
        guard let router = presenter.router as? InitRouterStub else {
            XCTFail("Expected InitRouterStub", file: "InitPresenterTest", line: 45)
            return
        }
        
        presenter.cellCharacterTapped(index: 0)
        XCTAssertEqual(router.executed, "10")
    }
    
    // MARK: - Helpers
    
    private func buildPresenter() -> InitPresenter {
        
        let presenter = InitPresenter()
        presenter.router = InitRouterStub()
        presenter.interactor = CharacterInteractorStub()
        
        let charaterDO = CharacterDO(id: 10, name: "TestMarvel", description: "", modified: "", resourceURI: "", urls: [], thumbnail: Image(path: "", ImageExtension: ""), image: nil, comics: Comics(available: 1, returned: 1, collectionURI: "", items: []), stories: Stories(available: 1, returned: 1, collectionURI: "", items: []), events: Comics(available: 1, returned: 1, collectionURI: "", items: []), series: Comics(available: 1, returned: 1, collectionURI: "", items: []))
        
        presenter.currentList = [CharacteresMarvel(character: charaterDO)]
        
        return presenter
    }
    
}
