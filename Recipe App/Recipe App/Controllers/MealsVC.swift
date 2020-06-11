//
//  MealsVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

//This class is for setting up the Meals page which shows all meals available
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
        
        //Retrieve all meals stored in the persistent database
        meals = global.meals
    }
    
    // MARK: - Handlers
    //Handles the side menu selection
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Meals)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Meals"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}

//Set up the table format for displaying the meals list
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

//Display the meal items in the list
extension MealsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    //Show meal name and image
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealItem", for: indexPath) as! MealListItem
        let meal = meals[indexPath.row]
        cell.Mealimage.image = meal.image
        cell.Mealtext.text = meal.title
        return cell
    }
}
