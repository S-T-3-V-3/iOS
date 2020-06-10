//
//  MealListItem.swift
//  Recipe App
//
//  Created by Steve on 10/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

class MealListItem: UITableViewCell {

    @IBOutlet weak var Mealimage: UIImageView!
    @IBOutlet weak var Mealtext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
