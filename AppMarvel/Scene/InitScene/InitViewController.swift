//
//  InitScenViewController.swift
//  MarvelApp
//
//  Created by DAVID GONZALEZ on 08/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import UIKit

protocol FirstViewProtocol: ViewProtocol {
    func showTableView(list: [CharacterViewModel])
    func showError(error: String)
}

class InitViewController: BaseViewController, FirstViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: InitPresenterProtcocol?
    var currentList: [CharacterViewModel] = [CharacterViewModel]()
    
    override class var storyboardName: String {
        return "Main"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.register(CharaterCell.self, forCellReuseIdentifier: "CharaterCell")
        tableView.register(UINib(nibName: "CharaterCell", bundle: nil), forCellReuseIdentifier: "CharaterCell")
        presenter?.viewDidLoad(viewProtocol: self)
    }
    
    func showTableView(list: [CharacterViewModel]) {
        self.currentList = list
        tableView.reloadData()
    }
    
    func showError(error: String) {
        titleLabel.text = error
    }
}

extension InitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return currentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharaterCell", for: indexPath) as! CharaterCell

        currentList[indexPath.row].view = cell
        currentList[indexPath.row].update()
        cell.selectionStyle = .none
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        presenter?.cellCharacterTapped(index: index)
    }
    
}
