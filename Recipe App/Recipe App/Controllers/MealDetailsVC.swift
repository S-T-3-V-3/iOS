//
//  MealDetailsVC.swift
//  Recipe App
//
//  Created by Chengrong Zhan on 9/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

class MealDetailsVC: UIViewController {
    
    var delegate: HomeControllerDelegate?
    var mealIndex: Int?
    @IBOutlet weak var MealImage: UIImageView!
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    @IBOutlet weak var instructions: UITextView!
    
    @IBAction func OnFavouritesClicked(_ sender: Any) {
        global.addToFavourites(index: mealIndex!)
    }
    @IBAction func OnThisWeekClicked(_ sender: Any) {
        global.addToThisWeek(index: mealIndex!)
    }
    
    
    var global: GlobalVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
