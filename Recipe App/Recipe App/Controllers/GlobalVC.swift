//
//  GlobalVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit

class GlobalVC: UIViewController {
    // MARK: - Properties
    var menuController: MenuVC!
    var currentController: UIViewController!
    var isMenuExpanded = false
    var meals = [Meal]()
    let data: Database = Database()
    
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
    let mealsStoryBoard = UIStoryboard(name: "Meals", bundle: nil)
    let shoppingStoryBoard = UIStoryboard(name: "Shopping", bundle: nil)
    let weekStoryBoard = UIStoryboard(name: "Week", bundle: nil)
    let favoriteStoryBoard = UIStoryboard(name: "Favorite", bundle: nil)
    
    var homeController: HomeVC!
    var weekController: ThisWeekVC!
    var mealsController: MealsVC!
    var shoppingController: ShoppingVC!
    var favouritesController: FavouritesVC!
    
    // MARK: - Init
        
    func load() {
        meals = data.load()
    }
    
    override func viewDidLoad() {
         //Load data about meals from Database class in Custom/dataloader.swift
        super.viewDidLoad()
        
        homeController = homeStoryBoard.instantiateViewController(withIdentifier: "Home") as? HomeVC
        weekController = weekStoryBoard.instantiateViewController(withIdentifier: "Week") as? ThisWeekVC
        mealsController = mealsStoryBoard.instantiateViewController(withIdentifier: "Meals") as? MealsVC
        shoppingController = shoppingStoryBoard.instantiateViewController(withIdentifier: "Shopping") as? ShoppingVC
        favouritesController = favoriteStoryBoard.instantiateViewController(withIdentifier: "Favourites") as? FavouritesVC
        
        homeController.delegate = self
        weekController.delegate = self
        mealsController.delegate = self
        shoppingController.delegate = self
        favouritesController.delegate = self

        meals = data.load()
        
        shoppingController.global = self
        shoppingController.viewDidLoad()
        shoppingController.loaded()
        
        showHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isMenuExpanded
    }

    // MARK: - Handlers
    func addToFavourites(index: Int) {
        // Load favourits
        var favourites = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        var doesExist = false
        
        // Check to see if this index already exists
        for favIndex in favourites {
            if favIndex == index {
                doesExist = true
            }
        }
        
        // If it doesnt exist, update favourites
        if !doesExist {
            favourites.append(index)
            UserDefaults.standard.set(favourites, forKey: "favourites")
        }
    }
    
    func removeFromFacourites(index: Int) {
        var favourites = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        favourites.removeAll{$0 == index}
        UserDefaults.standard.set(favourites, forKey: "favourites")
    }
    
    // Return a list of current favourite meals
    func getFavourites() -> [Meal] {
        meals = data.load()
        var favourites = [Meal]()
        let favIndex: [Int] = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        
        for index in favIndex {
            favourites.append(meals[index])
        }
        
        return favourites
    }
    
    func addToThisWeek(index: Int) {
        // Load this week
        var thisWeek = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        var doesExist = false
        
        // Check to see if this index already exists
        for thisWeekIndex in thisWeek {
            if thisWeekIndex == index {
                doesExist = true
            }
        }
        
        // If it doesnt exist, update this week
        if !doesExist {
            thisWeek.append(index)
            UserDefaults.standard.set(thisWeek, forKey: "thisWeek")
        }
    }
    
    func removeFromThisWeek(index: Int) {
        var thisWeek = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        thisWeek.removeAll{$0 == index}
        UserDefaults.standard.set(thisWeek, forKey: "thisWeek")
    }
    
    // Return a list of current favourite meals
    func getThisWeek() -> [Meal] {
        meals = data.load()
        var thisWeek = [Meal]()
        let thisWeekIndex: [Int] = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        
        for index in thisWeekIndex {
            thisWeek.append(meals[index])
        }
        
        return thisWeek
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuVC()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showHomeController() {
        if currentController != UINavigationController(rootViewController: homeController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: homeController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            homeController.configureUI()
        }
    }
    
    func showWeekController() {
        if currentController != UINavigationController(rootViewController: weekController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: weekController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            weekController.configureUI()
        }
    }
    
    func showMealsController() {
        if currentController != UINavigationController(rootViewController: mealsController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: mealsController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            mealsController.configureUI()
        }
    }
    
    func showShoppingController() {
        if currentController != UINavigationController(rootViewController: shoppingController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: shoppingController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            shoppingController.configureUI()
        }
    }
    
    func showFavouritesController() {
        if currentController != UINavigationController(rootViewController: favouritesController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: favouritesController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            favouritesController.configureUI()
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: MenuOptionValues?) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.currentController.view.frame.origin.x = self.currentController.view.frame.width - 160
            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.currentController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
            
            animateStatusBar()
        }
    }
    
    func didSelectMenuOption(menuOption: MenuOptionValues) {
        switch menuOption {
            case .Home:
                showHomeController()
            case .ThisWeek:
                showWeekController()
            case .Meals:
                showMealsController()
            case .ShoppingList:
                showShoppingController()
            case .Favourites:
                showFavouritesController()
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension GlobalVC: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOptionValues?) {
        if !isMenuExpanded {
            configureMenuController()
        }
        
        isMenuExpanded = !isMenuExpanded
        showMenuController(shouldExpand: isMenuExpanded, menuOption: menuOption)
    }
}
