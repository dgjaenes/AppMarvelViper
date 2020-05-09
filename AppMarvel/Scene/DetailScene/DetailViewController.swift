//
//  DetailViewController.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: ViewProtocol {
    func update(name:String, description:String, comics:Int, image: Data?)
    func showError(error: String)
}

class DetailViewController: BaseViewController, DetailViewProtocol {
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var comics: UILabel!
    @IBOutlet weak var numComics: UILabel!
    
    var presenter: DetailPresenterProtcocol?
    
    override class var storyboardName: String {
        return "Main"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(viewProtocol: self)
    }
    
    func update(name: String, description: String, comics: Int, image: Data?) {
        self.descriptionText.text = description
        self.name.text = name
        self.numComics.text = String(comics)
        if let imageData = image {
            imageIcon.image = UIImage(data: imageData)
        }
        self.comics.text = "Comics"
    }
    
    func showError(error: String) {
        self.name.text = error
    }
}
