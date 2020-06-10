//
//  HomeVC.swift
//  Recipe App
//
//  Created by Steve on 5/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    var global: GlobalVC = GlobalVC()
    var meals: [Meal] = [Meal]()
    
    @IBOutlet weak var popularLabel: UILabel?
    @IBOutlet weak var newLabel: UILabel?
    
    @IBOutlet weak var popularImage: UIImageView?
    @IBOutlet weak var newImage: UIImageView?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
        global.load()
        meals = global.meals
        showMeals()
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Home)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func showMeals(){
        let randomIndex = Int.random(in: 0..<meals.count-1)
        let newMealName: String = meals.last!.title
        let newMealImage: UIImage = meals.last!.image
        let popularMealName: String = meals[randomIndex].title
        let popularMealImage: UIImage = meals[randomIndex].image
        
        popularLabel?.text = popularMealName
        popularImage?.image = popularMealImage
        newLabel?.text = newMealName
        newImage?.image = newMealImage
        print("new meal: \(newMealName)")
        print("pop meal: \(popularMealName)")
    }
}
