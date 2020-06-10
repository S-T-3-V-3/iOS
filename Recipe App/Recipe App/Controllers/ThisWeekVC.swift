//
//  ThisWeekVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class ThisWeekVC: UIViewController{
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var weekTableView: UITableView!
    
    var global: GlobalVC = GlobalVC()
    var meals: [Meal] = [Meal]()
    
    // MARK: - Init

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //global.load() // load database
        mealsList = global.meals //intialise meals in this VC to the meals list in GlobalVC
        //you can also access variables in meals like: mealsList[0].title, mealsList[0].image - refer to Meals.swift
        str += String(mealsList.count)
        str += "\n"
        for i in mealsList {
            str += i.display() // display() function in Meals.swift : displays title,ingredients,instructions of a meal.
            str += "\n"
        }
        TestLabel.text = str //display
        
        configureUI()
        
        weekTableView.delegate = self
        weekTableView.dataSource = self
        
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
        
        navigationItem.title = "This Week's Meals"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}

extension ThisWeekVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let Storybard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "WeekDetailsVC") as? WeekDetailsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        /*if let DVC = Storybard.instantiateViewController(identifier: "MealDetailsVC") as? MealDetailsVC {
            if let indexPath = tableView.indexPathForSelectedRow {
                let v = meals[indexPath.row]
                DVC.GetName = v.title
                self.navigationController?.pushViewController(DVC, animated: true)
            }
        }*/
    }
}

extension ThisWeekVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell", for: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        cell.Mealtext.text = meal.title
        return cell
    }
}


