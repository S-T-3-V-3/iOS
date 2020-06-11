//
//  HomeVC.swift
//  Recipe App
//
//  Created by Steve on 5/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit


//This class is linked to Home storyboard. It is the Home page.
class HomeVC: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    var global: GlobalVC = GlobalVC()
    
    // Connections to the Home storyboard elements
    @IBOutlet weak var popularLabel: UILabel?
    @IBOutlet weak var newLabel: UILabel?
    
    @IBOutlet weak var popularImage: UIImageView?
    @IBOutlet weak var newImage: UIImageView?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showMeals()
    }
    
    // MARK: - Handlers
    // Toggles the menu, highlighting the selected option
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Home)
    }
    
    // Update the navigation bar
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    // Show the most popular and newest meal
    func showMeals() {
        if global.meals.count == 0 {
            global.meals = global.data.load()
        }
        // Retrieve a random meal, save this to use as a popular meal
        let randomIndex = Int.random(in: 0 ..< global.meals.count-1)
        
        // Newest meal is always the last meal in the array
        let newMealName: String = global.meals.last!.title
        let newMealImage: UIImage = global.meals.last!.image
        
        let popularMealName: String = global.meals[randomIndex].title
        let popularMealImage: UIImage = global.meals[randomIndex].image
        
        // Display the popular and new meal names and images
        popularLabel?.text = popularMealName
        popularImage?.image = popularMealImage
        
        newLabel?.text = newMealName
        newImage?.image = newMealImage
    }
}
