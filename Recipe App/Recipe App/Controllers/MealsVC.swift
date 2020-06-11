//
//  MealsVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

// This class is for setting up the Meals page which shows all meals available
class MealsVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var MealTableView: UITableView!
    
    var global: GlobalVC!
    var meals: [Meal] = [Meal]()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        MealTableView.delegate = self
        MealTableView.dataSource = self
        
        meals = global.meals // Retrieves list of meals from instanced global view controller
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
        
        navigationItem.title = "Meals"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}

// Configuration extension for setting up each meal
extension MealsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMeal: Meal = global.meals[indexPath.row]
        
        self.present(global.mealDetailsController, animated: true, completion: nil)
        
        global.mealDetailsController.NavigationTitle.title = currentMeal.title
        global.mealDetailsController.MealImage.image = currentMeal.image
        global.mealDetailsController.instructions.text = currentMeal.display()
        global.mealDetailsController.mealIndex = indexPath.row
    }
}

// Display the meal items in the list
extension MealsVC: UITableViewDataSource {
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
