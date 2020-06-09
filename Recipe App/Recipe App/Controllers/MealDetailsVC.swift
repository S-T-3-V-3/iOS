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
    
    @IBOutlet weak var MealDetailsRecipe: UILabel!
    
    var GetName = String()
    var GetImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
       MealDetailsImage.image = GetImage
       MealDetailsLabel.text = GetName
        
        
            
    }


}
