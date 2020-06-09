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
    
    var meals: [Meals] = []
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        MealTableView.delegate = self
        MealTableView.dataSource = self
        
        meals = loadMeals()
        
    }
    
    func loadMeals() -> [Meals]{
        
        var results:[Meals] = []
        let meal1 = Meals(image:UIImage(named: "food")!, title: "meal 1")
        let meal2 = Meals(image:UIImage(named: "food2")!, title: "meal 2")
        let meal3 = Meals(image:UIImage(named: "food3")!, title: "meal 3")
        
        results.append(meal1)
        results.append(meal2)
        results.append(meal3)
        
        return results
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
    
    /*override func numberOfSections(in tableView: UITableView) -> Int{
     reutrn 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }*/
}

extension MealsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("This row is tapped")
    }
}

extension MealsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealTableViewCell
        
        /*if indexPath.row == 0{
            
        cell.Mealimage.image = UIImage(named: "food")
        cell.Mealtext.text  = "Meal"*/
        
        //cell.textLabel?.text = "WORKING"
            
        //}
        
        let meal = meals[indexPath.row]
        
        cell.Mealimage.image = meal.image
        cell.Mealtext.text = meal.title
        
        return cell
    }
    

}
