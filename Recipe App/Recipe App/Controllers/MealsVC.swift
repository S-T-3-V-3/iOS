//
//  MealsVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class MealsVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var MealTableView: UITableView!
    var global: GlobalVC = GlobalVC()
    var meals: [Meal] = [Meal]()
    
    // MARK: - Init

    
    override func viewDidLoad() {
        super.viewDidLoad()
        global.load()
        configureUI()
        
        MealTableView.delegate = self
        MealTableView.dataSource = self
        
        meals = global.meals
    }
    
  
    
    // MARK: - Handlers
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

extension MealsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storybard = UIStoryboard(name: "Main", bundle: nil)
        
        if let DVC = Storybard.instantiateViewController(identifier: "MealDetailsVC") as? MealDetailsVC {
            if let indexPath = tableView.indexPathForSelectedRow {
                let v = meals[indexPath.row]
                DVC.GetImage = v.image
                DVC.GetName = v.title
                self.navigationController?.pushViewController(DVC, animated: true)
            }
        }
    }
}

extension MealsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        cell.Mealimage.image = meal.image
        cell.Mealtext.text = meal.title
        return cell
    }
}
