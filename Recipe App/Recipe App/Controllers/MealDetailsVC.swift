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
    @IBOutlet weak var MealImage: UIImageView!
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    var global: GlobalVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
