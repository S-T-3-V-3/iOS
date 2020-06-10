//
//  ShoppingVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class ShoppingVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    var global: GlobalVC!
    @IBOutlet weak var ingredientText: UILabel!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loaded() {
        var str: String = ""
        let test: String = String(global.meals.count)
        str += test
        for i in global.meals {
            str += i.displayIngredients()
        }
        DispatchQueue.main.async() {
            self.ingredientText!.text = "A"
            self.ingredientText!.text = str
        }
        configureUI()
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.ShoppingList)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
