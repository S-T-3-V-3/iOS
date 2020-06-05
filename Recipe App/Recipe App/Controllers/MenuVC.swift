//
//  MenuVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuOption"

class MenuVC: UIViewController {
    // MARK: - Properties
    var menuItemTable: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        configureTableView()
    }
    
    // MARK: - Handlers
    func configureTableView() {
        menuItemTable = UITableView()
        menuItemTable.delegate = self
        menuItemTable.dataSource = self
        menuItemTable.backgroundColor = .darkGray
        menuItemTable.separatorStyle = .none
        menuItemTable.rowHeight = 80
        
        menuItemTable.register(MenuOption.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(menuItemTable)
        menuItemTable.translatesAutoresizingMaskIntoConstraints = false
        menuItemTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuItemTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuItemTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuItemTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ menuItemTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ menuItemTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuItemTable.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOption
        
        let menuOption = MenuOptionValues(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    func tableView(_ menuItemTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOptionValues(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
