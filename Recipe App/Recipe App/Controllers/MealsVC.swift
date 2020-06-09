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
    
    var meals: [Meal] = []
    
    // MARK: - Init

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        MealTableView.delegate = self
        MealTableView.dataSource = self
        
        meals = loadMeals()
       
    }
    
    func loadMeals() -> [Meal]{
        
        var results:[Meal] = []
       
        let meal1 = Meal(image:UIImage(imageLiteralResourceName: "food"), title: "meal 1")
        let meal2 = Meal(image:UIImage(imageLiteralResourceName: "food2"), title: "meal 2")
        let meal3 = Meal(image:UIImage(imageLiteralResourceName: "food3"), title: "meal 3")
        let meal4 = Meal(image:UIImage(imageLiteralResourceName: "food4"), title: "meal 4")
        let meal5 = Meal(image:UIImage(imageLiteralResourceName: "food5"), title: "meal 5")
        let meal6 = Meal(image:UIImage(imageLiteralResourceName: "food6"), title: "meal 6")
        let meal7 = Meal(image:UIImage(imageLiteralResourceName: "food7"), title: "meal 7")
        let meal8 = Meal(image:UIImage(imageLiteralResourceName: "food8"), title: "meal 8")
        
        results.append(meal1)
        results.append(meal2)
        results.append(meal3)
        results.append(meal4)
        results.append(meal5)
        results.append(meal6)
        results.append(meal7)
        results.append(meal8)
        
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
    
}

extension MealsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let Storybard = UIStoryboard(name: "Main", bundle: nil)
            
            if let DVC = Storybard.instantiateViewController(identifier: "MealDetailsVC") as? MealDetailsVC {
                
                if let indexPath = tableView.indexPathForSelectedRow{
                    
                    let v = meals[indexPath.row]
                    
                    DVC.GetImage = v.image
                    DVC.GetName = v.title
                    
                    
                    
                    self.navigationController?.pushViewController(DVC, animated: true)
                    
                }
        }
   }
    
    
}

extension MealsVC: UITableViewDataSource{
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
