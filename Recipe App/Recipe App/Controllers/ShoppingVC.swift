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
    var selectedMeals: [Meal] = []
    var combinedIngredients: [ingredient] = []
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedMeals = global.meals
        var str: String = ""
        let test: String = String(global.meals.count)
        str += test
        for i in global.meals {
            combinedIngredients.append(contentsOf: i.ingredients)
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

extension ShoppingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return global.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingcell", for: indexPath) as! MealListItem
        let i = combinedIngredients[indexPath.row]
        cell.ingredientName!.text = i.name!
        cell.ingredientQuantity!.text = String(i.quantity!) + i.measurement!.rawValue
        return cell
    }
}
