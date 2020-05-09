
import Foundation
import UIKit


struct FeaturesProvider {
    static func buildDefaultView() -> InitViewController {
        let view: InitViewController = InitViewController.create()

        let presenter = InitPresenter()
        let router = InitRouter()
        presenter.router = router
        presenter.interactor = InteractorProvaider.getCharactersInteractor()
        view.presenter = presenter
        router.view = view
        
        return view
    }
    
    static func buildDetailFeatureView(characterId: Int) -> DetailViewController {
        let view : DetailViewController = DetailViewController.create()
        
        let presenter = DetailPresenter(characterId: characterId)
        let router = DetailRouter()
        presenter.router = router
        presenter.interactor = InteractorProvaider.getCharactersInteractor()
        view.presenter = presenter
        router.detailView = view
        
        return view
    }
}


