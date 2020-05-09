//
//  CharaterCell.swift
//  AppMarvel
//
//  Created by DAVID GONZALEZ on 09/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import UIKit

class CharaterCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension CharaterCell: CharacterViewModelProtocol {
    func show(name: String, description: String, image: Data?) {
        self.name.text = name
               self.descriptionLabel.text = description
               if let imageData = image {
                   self.imageIcon.image = UIImage(data: imageData)
               }
    }
}
