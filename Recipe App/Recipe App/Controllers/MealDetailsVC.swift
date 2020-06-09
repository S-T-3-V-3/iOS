//
//  MealDetailsVC.swift
//  Recipe App
//
//  Created by Chengrong Zhan on 9/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

class MealDetailsVC: UIViewController {

    @IBOutlet weak var MealDetailsImage: UIImageView!
    @IBOutlet weak var MealDetailsLabel: UILabel!
    
    var meal : Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meal = meal{
            self.MealDetailsImage.image = meal.image
            self.MealDetailsLabel.text = meal.title
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
