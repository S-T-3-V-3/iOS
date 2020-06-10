//
//  HomeVC.swift
//  Recipe App
//
//  Created by Steve on 5/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    //temp meals until I can retrieve meals from other controllers
    let popularMeal = Meal(image:UIImage(imageLiteralResourceName: "food"), title: "meal 1" )
    let newMeal = Meal(image:UIImage(imageLiteralResourceName: "food8"), title: "meal 8")
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Home)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
