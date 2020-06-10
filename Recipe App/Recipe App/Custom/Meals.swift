//
//  Recipe.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit
import Foundation


class Meal{
    var image: UIImage
    var title: String
    var ingredients = Array<ingredient>()
    var instructions = Array<String>()
    
    init(image:UIImage, title: String) {
        self.image = image
        self.title = title
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
    
    func numberOfIngredients() -> Int {
        return ingredients.count
    }
    
    func displayIngredients() -> String{
        var result: String = ""
        
        for i in ingredients {
            if i.measurement == measurementType.drizzle {
                result += "a drizzle of " + i.name! + "\n"
            }
            else if i.measurement == measurementType.bunch {
                result += "a bunch of " + i.name! + "\n"
            }
            else {
                let s = String(i.quantity!) + " " +  i.measurement!.rawValue + "  " + i.name! + " " + "\n" //could not figure out how to print enum value yet
                result += s
            }
        }
        return result
    }
    
    func display() -> String {
        var result: String = ""
        
        let s: String = "- Ingredients - \n\n" + displayIngredients() + "\n- Instructions - \n\n" + displayInstructions()
        
        result += s
        return result
    }
    
    
}


