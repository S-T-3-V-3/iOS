//
//  ThisWeekVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class ThisWeekVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    var global: GlobalVC = GlobalVC()
    var mealsList: [Meal] = [Meal]()
    var str: String = ""
    
    @IBOutlet weak var TestLabel: UILabel!
    
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
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.ThisWeek)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "This Week"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
