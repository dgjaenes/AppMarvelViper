//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import UIKit

//feuture protocol

protocol PresenterProtcocol: class {
    func viewDidLoad(viewProtocol: ViewProtocol)
}

protocol ViewProtocol: class {
    func showLoading()
    func hideLoading()
}

protocol RouterProtocol: class {
}

//BaseView

class BaseViewController : UIViewController, ViewProtocol {
    
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    class var storyboardName: String {
        fatalError("FatalError: View controller storyboard not set")
    }
    
    class var viewControllerIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    class func create<T>() -> T where T: BaseViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? T else {
            fatalError("View Controller not found!!")
        }
        return viewController
    }
    
    func showLoading() {
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
    }
    
    func hideLoading() {
        myActivityIndicator.removeFromSuperview()
    }
    
}

