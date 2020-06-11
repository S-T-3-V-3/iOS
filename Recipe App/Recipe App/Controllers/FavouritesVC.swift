//
//  FavouritesVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class FavouritesVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var FavTableView: UITableView!
    var global: GlobalVC!
    var meals: [Meal] = [Meal]()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        meals = global.getFavourites() // Retrieves list of favourited meals from instanced global view controller
        FavTableView.delegate = self
        FavTableView.dataSource = self
    }
    
    // MARK: - Handlers
    // Toggles the menu, highlighting the selected option
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Meals)
    }
    
    // Update the navigation bar
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Favourite Meals"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}

// Set up the format for displaying the favourite meals
extension FavouritesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMeal: Meal = global.meals[indexPath.row]
        
        self.present(global.mealDetailsController, animated: true, completion: nil)
        
        global.mealDetailsController.NavigationTitle.title = currentMeal.title
        global.mealDetailsController.MealImage.image = currentMeal.image
        global.mealDetailsController.instructions.text = currentMeal.display()
        global.mealDetailsController.mealIndex = indexPath.row
    }
}

// Display the favourite meals
extension FavouritesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    // Set meal image and name
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealItem", for: indexPath) as! MealListItem
        let meal = meals[indexPath.row]
        cell.Mealimage.image = meal.image
        cell.Mealtext.text = meal.title
        return cell
    }
}
