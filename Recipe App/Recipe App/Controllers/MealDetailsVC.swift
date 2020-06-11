//
//  MealDetailsVC.swift
//  Recipe App
//
//  Created by Chengrong Zhan on 9/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit


//This class is for showing the recipe of a meal that is clicked
class MealDetailsVC: UIViewController {
    
    var delegate: HomeControllerDelegate?
    var mealIndex: Int?
    var global: GlobalVC!
    
    @IBOutlet weak var MealImage: UIImageView!
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    @IBOutlet weak var instructions: UITextView!
    
    //Add this meal to favourites when user clicks favourite button
    @IBAction func OnFavouritesClicked(_ sender: Any) {
        global.addToFavourites(index: mealIndex!)
    }
    //Add this meal to This Week when user clicks cart button
    @IBAction func OnThisWeekClicked(_ sender: Any) {
        global.addToThisWeek(index: mealIndex!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
