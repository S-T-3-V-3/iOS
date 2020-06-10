//
//  dataloader.swift
//  Recipe App
//
//  Created by Steve on 10/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class Database{
    
    func load() -> [Meal]{
        var meals = [Meal]()
        
        let m1:Meal = Meal(image:UIImage(imageLiteralResourceName: "cheesyBeefBurger"), title: "Cheesy Beef Burger")
        
        m1.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m1.addIngredient(newIngredient: ingredient(name:"potato", quantity:2,measurement:measurementType.none))
        m1.addIngredient(newIngredient: ingredient(name:"rosemary", quantity:1, measurement:measurementType.bunch))
        m1.addIngredient(newIngredient: ingredient(name:"brown onion", quantity:1, measurement:measurementType.none))
        m1.addIngredient(newIngredient: ingredient(name:"beef mince", quantity:300, measurement:measurementType.gram))
        m1.addIngredient(newIngredient: ingredient(name:"egg", quantity:1, measurement:measurementType.none))
        m1.addIngredient(newIngredient: ingredient(name:"brown sugar", quantity:1, measurement:measurementType.teaspoon))
        m1.addIngredient(newIngredient: ingredient(name:"burger bun", quantity:2, measurement:measurementType.none))
        m1.addIngredient(newIngredient: ingredient(name:"tomato", quantity:1, measurement:measurementType.none))
        m1.addIngredient(newIngredient: ingredient(name:"mixed salad leaves", quantity:30, measurement:measurementType.gram))
        
        m1.addInstruction(step: "Bake the chips in the oven with 220'C fan-forced for 25-30 min.")
        m1.addInstruction(step: "Combine beef mince, salt, egg, rosmary and pepper.")
        m1.addInstruction(step: "Shape the beef mixture into evenly sized patties.")
        m1.addInstruction(step: "Caramelise the onion with brown sugar.")
        m1.addInstruction(step: "Cook the patties, 4-5 minutes each side.")
        m1.addInstruction(step: "Serve up with the mixed salad leaves, tomato, beef patties, caramelised onion")
        
        meals.append(m1)
        
        
        let m2:Meal = Meal(image:UIImage(imageLiteralResourceName: "creamyLeakMustardChicken"), title: "Chreamy Leek Mustard Chicken")
        
        m2.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m2.addIngredient(newIngredient: ingredient(name:"potato", quantity:2,measurement:measurementType.none))
        m2.addIngredient(newIngredient: ingredient(name:"carrot", quantity:1, measurement:measurementType.none))
        m2.addIngredient(newIngredient: ingredient(name:"broccoli", quantity:1, measurement:measurementType.none))
        m2.addIngredient(newIngredient: ingredient(name:"leek", quantity:1, measurement:measurementType.none))
        m2.addIngredient(newIngredient: ingredient(name:"chicken breast", quantity:400, measurement:measurementType.gram))
        m2.addIngredient(newIngredient: ingredient(name:"cooking cream", quantity:1, measurement:measurementType.cup))
        m2.addIngredient(newIngredient: ingredient(name:"mustard", quantity:20, measurement:measurementType.gram))
        m2.addIngredient(newIngredient: ingredient(name:"milk", quantity:2, measurement:measurementType.tablespoon))
        m2.addIngredient(newIngredient: ingredient(name:"garlic", quantity:1, measurement:measurementType.none))
        
        m2.addInstruction(step: "Chop the veggies.")
        m2.addInstruction(step: "Cook the veggies in a steamer for 10 minutes.")
        m2.addInstruction(step: "Cook the chicken on the pan, 3-5 minutes each side.")
        m2.addInstruction(step: "Make the creamy sauce with leek,cooking cream and mustard.")
        m2.addInstruction(step: "Mash the potato with milk,salt and butter.")
        m2.addInstruction(step: "Serve up with mashed potato and top with veggies,chicken and the creemy leek.")
        
        meals.append(m2)
        
        let m3:Meal = Meal(image:UIImage(imageLiteralResourceName: "thaiSpicedBeefStirFry"), title: "Thai Spiced Beef Stir-Fry")
        
        m3.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m3.addIngredient(newIngredient: ingredient(name:"jasmine rice", quantity:2,measurement:measurementType.cup))
        m3.addIngredient(newIngredient: ingredient(name:"carrot", quantity:1, measurement:measurementType.none))
        m3.addIngredient(newIngredient: ingredient(name:"red onion", quantity:1, measurement:measurementType.none))
        m3.addIngredient(newIngredient: ingredient(name:"leek", quantity:1, measurement:measurementType.none))
        m3.addIngredient(newIngredient: ingredient(name:"green beans", quantity:100, measurement:measurementType.gram))
        m3.addIngredient(newIngredient: ingredient(name:"beef strips", quantity:250, measurement:measurementType.gram))
        m3.addIngredient(newIngredient: ingredient(name:"soy sauce", quantity:2, measurement:measurementType.tablespoon))
        m3.addIngredient(newIngredient: ingredient(name:"sweet chilli sauce", quantity:4, measurement:measurementType.tablespoon))
        
        m3.addInstruction(step: "Cook the rice with butter and garlic.")
        m3.addInstruction(step: "Chop the veggies.")
        m3.addInstruction(step: "Cook the beef strip until browned.")
        m3.addInstruction(step: "Cook the veggies for 6-7 minutes.")
        m3.addInstruction(step: "Add the browned beef, soy sauce and sweet chilli to the veggies.")
        m3.addInstruction(step: "Serve up with the rice and the beef stir-fry.")
        
        meals.append(m3)
        
        let m4:Meal = Meal(image:UIImage(imageLiteralResourceName: "salmonBombayPotatoes"), title: "Indian Salmon & Bombay Potatoes")
        
        m4.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m4.addIngredient(newIngredient: ingredient(name:"potato", quantity:2,measurement:measurementType.none))
        m4.addIngredient(newIngredient: ingredient(name:"tumeric", quantity:2, measurement:measurementType.tablespoon))
        m4.addIngredient(newIngredient: ingredient(name:"cucumber", quantity:1, measurement:measurementType.none))
        m4.addIngredient(newIngredient: ingredient(name:"tomato", quantity:1, measurement:measurementType.none))
        m4.addIngredient(newIngredient: ingredient(name:"mixed salad leaves", quantity:60, measurement:measurementType.gram))
        m4.addIngredient(newIngredient: ingredient(name:"mumbai spice blend", quantity:3, measurement:measurementType.tablespoon))
        m4.addIngredient(newIngredient: ingredient(name:"salmon", quantity:400, measurement:measurementType.gram))
        m4.addIngredient(newIngredient: ingredient(name:"coriander", quantity:50, measurement:measurementType.gram))
        m4.addIngredient(newIngredient: ingredient(name:"honey", quantity:1, measurement:measurementType.teaspoon))
        m4.addIngredient(newIngredient: ingredient(name:"greek yogurt", quantity:100, measurement:measurementType.gram))
        
        m4.addInstruction(step: "Chop the veggies.")
        m4.addInstruction(step: "Roast the potato in oven for 20-25 minutes.")
        m4.addInstruction(step: "Make the galric yogurt with greek yogurt and the garlic oil.")
        m4.addInstruction(step: "Make the salad with coriander,cucumber and tomato.")
        m4.addInstruction(step: "Flavour the salmon with mumbai spice blend, olive oil, salt and pepper.")
        m4.addInstruction(step: "Cook the salmon for 3-4 minutes each side.")
        m4.addInstruction(step: "Serve up with the potato, salad and top the salmon with garlic yogurt.")
        
        meals.append(m4)
        
        let m5:Meal = Meal(image:UIImage(imageLiteralResourceName: "beefBurritoBowl"), title: "Beef Burrito Bowl")
        
        m5.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m5.addIngredient(newIngredient: ingredient(name:"basmati rice", quantity:2,measurement:measurementType.cup))
        m5.addIngredient(newIngredient: ingredient(name:"garlic", quantity:2, measurement:measurementType.none))
        m5.addIngredient(newIngredient: ingredient(name:"corn", quantity:1, measurement:measurementType.none))
        m5.addIngredient(newIngredient: ingredient(name:"tomato", quantity:1, measurement:measurementType.none))
        m5.addIngredient(newIngredient: ingredient(name:"cucumber", quantity:1, measurement:measurementType.none))
        m5.addIngredient(newIngredient: ingredient(name:"carrot", quantity:1, measurement:measurementType.none))
        m5.addIngredient(newIngredient: ingredient(name:"beef mince", quantity:200, measurement:measurementType.gram))
        m5.addIngredient(newIngredient: ingredient(name:"tomato paste", quantity:3, measurement:measurementType.tablespoon))
        m5.addIngredient(newIngredient: ingredient(name:"sour cream", quantity:100, measurement:measurementType.gram))
        m5.addIngredient(newIngredient: ingredient(name:"cheddar cheese", quantity:50, measurement:measurementType.gram))
        
        m5.addInstruction(step: "Make the garlic rice.")
        m5.addInstruction(step: "Chop the veggies.")
        m5.addInstruction(step: "Make the pico de gallo salsa with cucumber, tomato, red onion and lime juice.")
        m5.addInstruction(step: "Cook the beef mince for 3-4 minutes and add carrot to it.")
        m5.addInstruction(step: "Add the spice and tomato paste, then cook until fragrant.")
        m5.addInstruction(step: "Serve up with the rice, beef, cheddar cheese and pico de gallo salsa.")
        
        meals.append(m5)
        
        let m6:Meal = Meal(image:UIImage(imageLiteralResourceName: "caramelisedOnionChicken"), title: "Caramelised Onion & Chicken")
        
        m6.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m6.addIngredient(newIngredient: ingredient(name:"garlic", quantity:1,measurement:measurementType.none))
        m6.addIngredient(newIngredient: ingredient(name:"potato", quantity:2, measurement:measurementType.none))
        m6.addIngredient(newIngredient: ingredient(name:"brown onion", quantity:1, measurement:measurementType.none))
        m6.addIngredient(newIngredient: ingredient(name:"chicken breast", quantity:350, measurement:measurementType.gram))
        m6.addIngredient(newIngredient: ingredient(name:"rosemary", quantity:1, measurement:measurementType.bunch))
        m6.addIngredient(newIngredient: ingredient(name:"chilli flakes", quantity:5, measurement:measurementType.gram))
        m6.addIngredient(newIngredient: ingredient(name:"green beans", quantity:200, measurement:measurementType.gram))
        m6.addIngredient(newIngredient: ingredient(name:"brown sugar", quantity:2, measurement:measurementType.teaspoon))
        m6.addIngredient(newIngredient: ingredient(name:"fetta", quantity:50, measurement:measurementType.gram))
        m6.addIngredient(newIngredient: ingredient(name:"spinach leaves", quantity:30, measurement:measurementType.gram))
        
        m6.addInstruction(step: "Roast the potato with rosemary in oven for 20-25 minutes.")
        m6.addInstruction(step: "Chop the veggies.")
        m6.addInstruction(step: "Slice the chicken horizontally and rub with salt,pepper and olive oil.")
        m6.addInstruction(step: "Add the caramelised onion and fetta on the chicken.")
        m6.addInstruction(step: "Cook the chicken on the pan for 8-10 minutes.")
        m6.addInstruction(step: "Serve up with the rosemary potato, caramelised onion and fetta chicken.")
        
        meals.append(m6)
        
        let m7:Meal = Meal(image:UIImage(imageLiteralResourceName: "beefKoftasCouscousTabbouleh"), title: "Beef Koftas & Couscous Tabbouleh")
        
        m7.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m7.addIngredient(newIngredient: ingredient(name:"garlic", quantity:1,measurement:measurementType.none))
        m7.addIngredient(newIngredient: ingredient(name:"couscous", quantity:2, measurement:measurementType.cup))
        m7.addIngredient(newIngredient: ingredient(name:"currents", quantity:20, measurement:measurementType.gram))
        m7.addIngredient(newIngredient: ingredient(name:"tomato", quantity:1, measurement:measurementType.none))
        m7.addIngredient(newIngredient: ingredient(name:"cucumber", quantity:1, measurement:measurementType.none))
        m7.addIngredient(newIngredient: ingredient(name:"greek yogurt", quantity:100, measurement:measurementType.gram))
        m7.addIngredient(newIngredient: ingredient(name:"beef mince", quantity:400, measurement:measurementType.gram))
        m7.addIngredient(newIngredient: ingredient(name:"egg", quantity:1, measurement:measurementType.none))
        m7.addIngredient(newIngredient: ingredient(name:"breadcrumbs", quantity:50, measurement:measurementType.gram))
        m7.addIngredient(newIngredient: ingredient(name:"spinach leaves", quantity:30, measurement:measurementType.gram))
        
        m7.addInstruction(step: "Cook the couscous with currents.")
        m7.addInstruction(step: "Chop the veggies.")
        m7.addInstruction(step: "Make the koftas with beef mince,egg and breadcrumbs")
        m7.addInstruction(step: "Cook the koftas on the pan for 11-12 minutes")
        m7.addInstruction(step: "Mix tomato, cucumber, spinach and couscous.")
        m7.addInstruction(step: "Serve up with the couscous tabbouleh and the beef koftas.")
        
        meals.append(m7)
        
        let m8:Meal = Meal(image:UIImage(imageLiteralResourceName: "honeySoyGlazedChicken"), title: "Honey-Soy Glazed Chicken")
        
        m8.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m8.addIngredient(newIngredient: ingredient(name:"potato", quantity:2,measurement:measurementType.none))
        m8.addIngredient(newIngredient: ingredient(name:"spring onion", quantity:1, measurement:measurementType.bunch))
        m8.addIngredient(newIngredient: ingredient(name:"garlic aioli", quantity:50, measurement:measurementType.gram))
        m8.addIngredient(newIngredient: ingredient(name:"tomato", quantity:1, measurement:measurementType.none))
        m8.addIngredient(newIngredient: ingredient(name:"mixed salad leaves", quantity:60, measurement:measurementType.gram))
        m8.addIngredient(newIngredient: ingredient(name:"mumbai spice blend", quantity:3, measurement:measurementType.tablespoon))
        m8.addIngredient(newIngredient: ingredient(name:"chicken thigh", quantity:400, measurement:measurementType.gram))
        m8.addIngredient(newIngredient: ingredient(name:"soy sauce", quantity:2, measurement:measurementType.tablespoon))
        m8.addIngredient(newIngredient: ingredient(name:"honey", quantity:1, measurement:measurementType.tablespoon))
        m8.addIngredient(newIngredient: ingredient(name:"sugar snap peas", quantity:100, measurement:measurementType.gram))
        
        m8.addInstruction(step: "Bake the fries in the oven for 25-30 minutes.")
        m8.addInstruction(step: "Flavour the chicken with garlic, soy sauce and honey.")
        m8.addInstruction(step: "Slice the spring onion and sugar snap peas.")
        m8.addInstruction(step: "Cook the chicken on the pan for 10-14 minutes.")
        m8.addInstruction(step: "Make the salad with salad leaves, spring onion and sugar snap peas.")
        m8.addInstruction(step: "Serve up with the chips, salad and honey-soy glazed chicken.")
        
        meals.append(m8)
        
        let m9:Meal = Meal(image:UIImage(imageLiteralResourceName: "teriyakiPorkRissoles"), title: "Teriyaki-Glazed Pork Rissoles")
               
        m9.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m9.addIngredient(newIngredient: ingredient(name:"basmati rice", quantity:2,measurement:measurementType.cup))
        m9.addIngredient(newIngredient: ingredient(name:"snow peas", quantity:100, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"japanese dressing", quantity:20, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"mayonnaise", quantity:20, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"egg", quantity:1, measurement:measurementType.none))
        m9.addIngredient(newIngredient: ingredient(name:"breadcrumbs", quantity:30, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"pork mince", quantity:400, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"teriyaki sauce", quantity:65, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"slaw mix", quantity:150, measurement:measurementType.gram))
        m9.addIngredient(newIngredient: ingredient(name:"sesame seeds", quantity:15, measurement:measurementType.gram))
               
        m9.addInstruction(step: "Cook the garlic rice.")
        m9.addInstruction(step: "Combine the japanese dressing, mayonnaise.")
        m9.addInstruction(step: "Combine the egg, pork mince, spring onion and breadcrumbs and shape into meatballs.")
        m9.addInstruction(step: "Cook the rissoles on the pan for 8-10 minutes.")
        m9.addInstruction(step: "Dress the slaw with dressing.")
        m9.addInstruction(step: "Serve up with the garlic rice, teriyaki pork rissoles and the slaw.")
               
        meals.append(m9)
        
        let m10:Meal = Meal(image:UIImage(imageLiteralResourceName: "sichuanBeefAsianGreen"), title: "Sichuan Beef & Asian Greens")
               
        m10.addIngredient(newIngredient: ingredient(name:"olive oil", quantity:1, measurement:measurementType.drizzle))
        m10.addIngredient(newIngredient: ingredient(name:"basmati rice", quantity:2,measurement:measurementType.cup))
        m10.addIngredient(newIngredient: ingredient(name:"ginger", quantity:10, measurement:measurementType.gram))
        m10.addIngredient(newIngredient: ingredient(name:"asian greens", quantity:1, measurement:measurementType.bunch))
        m10.addIngredient(newIngredient: ingredient(name:"carrot", quantity:1, measurement:measurementType.none))
        m10.addIngredient(newIngredient: ingredient(name:"spring onion", quantity:1, measurement:measurementType.bunch))
        m10.addIngredient(newIngredient: ingredient(name:"butter", quantity:20, measurement:measurementType.gram))
        m10.addIngredient(newIngredient: ingredient(name:"beef strips", quantity:300, measurement:measurementType.gram))
        m10.addIngredient(newIngredient: ingredient(name:"soy sauce", quantity:1, measurement:measurementType.tablespoon))
        m10.addIngredient(newIngredient: ingredient(name:"sichuan garlic paste", quantity:80, measurement:measurementType.gram))
        m10.addIngredient(newIngredient: ingredient(name:"long red chilli", quantity:1, measurement:measurementType.none))
               
        m10.addInstruction(step: "Cook the garlic rice.")
        m10.addInstruction(step: "Chop the veggies.")
        m10.addInstruction(step: "Flavour the beef with ginger, garlic and olive oil.")
        m10.addInstruction(step: "Cook the beef on the pan for 4-5 minutes.")
        m10.addInstruction(step: "Cook the veggies with sichuan garlic paste and soy sauce.")
        m10.addInstruction(step: "Serve up with the garlic rice, beef and veggies.")
               
        meals.append(m10)
        
        return meals
        
    }
}
