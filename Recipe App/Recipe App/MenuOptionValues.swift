//
//  MenuOptionValues.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

enum MenuOptionValues: Int, CustomStringConvertible {
    case Home
    case ThisWeek
    case Meals
    case ShoppingList
    case Favourites
    
    var description: String {
        switch self {
            case .Home: return "Home"
            case .ThisWeek: return "This Week"
            case .Meals: return "Meals"
            case .ShoppingList: return "Shopping List"
            case .Favourites: return "Favourites"
        }
    }
    
    var image: UIImage {
        switch self {
            case .Home: return UIImage(named: "home") ?? UIImage()
            case .ThisWeek: return UIImage(named: "today") ?? UIImage()
            case .Meals: return UIImage(named: "food2") ?? UIImage()
            case .ShoppingList: return UIImage(named: "shopping") ?? UIImage()
            case .Favourites: return UIImage(named: "favourite_selected") ?? UIImage()
        }
    }
}
