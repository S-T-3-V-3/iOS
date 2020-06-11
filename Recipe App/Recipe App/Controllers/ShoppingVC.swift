//
//  ShoppingVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

// This class is for setting up the shopping cart page
class ShoppingVC: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var ShoppingTableView: UITableView!
    var delegate: HomeControllerDelegate?
    var global: GlobalVC!
    var selectedMeals: [Meal] = []
    var ingredientList: [ingredient] = []
    var combinedList: [ingredient] = []
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShoppingTableView.dataSource = self
        
        selectedMeals = global.getThisWeek() // Retrieves list of this weeks meals from instanced global view controller
        for i in selectedMeals {
            ingredientList.append(contentsOf: i.ingredients)
        }
        combineIngredients()
        configureUI()
    }
    
    // Combine all the ingredients of the selected meals into an array, grouping quantity by ingredient name
    func combineIngredients() {
        for i:ingredient in ingredientList {
            if combinedList.count > 0 {
                var exists = false
                for j in 0 ... combinedList.count-1 {
                    if i.name == combinedList[j].name {
                        exists = true
                        combinedList[j].quantity! += i.quantity!
                    }
                }
                if !exists {
                    combinedList.append(i)
                }
            }
            else {
                combinedList.append(i)
            }
        }
    }
    
    // MARK: - Handlers
    // Toggles the menu, highlighting the selected option
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.ShoppingList)
    }
    
    // Update the navigation bar
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}

// Display the ingredients list
extension ShoppingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return combinedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingcell", for: indexPath) as! MealListItem
        let i = combinedList[indexPath.row]
        cell.ingredientName.text = i.name!
        cell.ingredientQuantity.text = String(i.quantity!) + " " + i.measurement!.rawValue
        return cell
    }
}
