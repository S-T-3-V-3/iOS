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
            result.append("\n")
        }
        
        return result
    }
    
    func displayIngredients() -> String{
        var result: String = ""
        
        for i in ingredients {
            let s = i.name! + " " + String(i.quantity!) + "\n" //could not figure out how to print enum value yet
            result += s
        }
        return result
    }
    
    func display() -> String {
        var result: String = ""
        
        let s: String = "Title:" + title + "\nIngredients: " + displayIngredients() + "\nInstructions: \n" + displayInstructions()
        
        result += s
        return result
    }
    
    
}


