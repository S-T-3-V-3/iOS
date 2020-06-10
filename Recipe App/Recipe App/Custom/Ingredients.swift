//
//  Ingredients.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation

enum measurementType: String {
    case gram = "g"
    case kilo = "Kg"
    case mililitre = "ml"
    case litre = "L"
    case cup = "cup"
    case teaspoon = "tsp"
    case tablespoon = "tbs"
    case pinch = "pinch"
    case drizzle = "drizzle"
    case bunch = "bunch"
    case none = " "
}

struct ingredient {
    let name: String?
    var quantity: Int?
    let measurement: measurementType?
    
    init(name: String? = nil, quantity:Int? = nil, measurement: measurementType? = nil) {
        self.name = name
        self.quantity = quantity
        self.measurement = measurement
    }
}
 
