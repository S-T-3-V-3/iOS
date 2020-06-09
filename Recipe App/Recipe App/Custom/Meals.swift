//
//  Recipe.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit
import Foundation


class Meals{
    var image: UIImage
    var title: String
    
    init(image:UIImage, title: String) {
        
        self.image = image
        self.title = title
    }
}

class Recipe {
    var name: String
    var ingredients = Array<ingredient>()
    var instructions = Array<String>()
    
    required init(name: String) {
        self.name = name
    }
    
    func addIngredient(newIngredient: ingredient) {
        self.ingredients.append(newIngredient)
    }
    
    func addInstruction(step: String) {
        self.instructions.append(step)
    }
    
    func displayInstructions() -> String {
        var result: String = ""
        var counter: Int = 0
        
        for step: String in self.instructions {
            counter += 1
            result.append("\(counter): \n")
            result.append(contentsOf: step)
            result.append("\n\n")
        }
        
        return result
    }
}


