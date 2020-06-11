//
//  GlobalVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import UIKit


/*
This is a global class used by all other controllers.
It performs the setup of each page including the toggling and usage of the side menu.
It retrieves the meal data stored in the persistent database and stores it in an array here.
Other controllers access this class to retrieve data, as we asynchronously load view controllers.
 */

class GlobalVC: UIViewController {
    // MARK: - Properties
    var menuController: MenuVC!
    var currentController: UIViewController!
    var isMenuExpanded = false
    var meals = [Meal]()
    let data: Database = Database()
    
    // Set references for each storyboard. This was set up so that we could all make changes to specific view controllers without git conflicts
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
    let mealsStoryBoard = UIStoryboard(name: "Meals", bundle: nil)
    let shoppingStoryBoard = UIStoryboard(name: "Shopping", bundle: nil)
    let weekStoryBoard = UIStoryboard(name: "Week", bundle: nil)
    let favoriteStoryBoard = UIStoryboard(name: "Favorite", bundle: nil)
    
    // Set variables to hold references to each instantiated controller
    var homeController: HomeVC!
    var weekController: ThisWeekVC!
    var mealsController: MealsVC!
    var shoppingController: ShoppingVC!
    var favouritesController: FavouritesVC!
    var mealDetailsController: MealDetailsVC!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate and set the value of each controller reference
        homeController =        homeStoryBoard.instantiateViewController(withIdentifier: "Home") as? HomeVC
        weekController =        weekStoryBoard.instantiateViewController(withIdentifier: "Week") as? ThisWeekVC
        mealsController =       mealsStoryBoard.instantiateViewController(withIdentifier: "Meals") as? MealsVC
        mealDetailsController = mealsStoryBoard.instantiateViewController(withIdentifier: "MealDetails") as? MealDetailsVC
        shoppingController =    shoppingStoryBoard.instantiateViewController(withIdentifier: "Shopping") as? ShoppingVC
        favouritesController =  favoriteStoryBoard.instantiateViewController(withIdentifier: "Favourites") as? FavouritesVC
        
        // Load the database
        meals = data.load()
        
        // Set delegate and self refrences in each controller so we can access the menus
        homeController.delegate = self
        homeController.global = self
        
        weekController.delegate = self
        weekController.global = self
        
        mealsController.delegate = self
        mealsController.global = self
        
        mealDetailsController.delegate = self
        mealDetailsController.global = self
        
        shoppingController.delegate = self
        shoppingController.global = self
        
        favouritesController.delegate = self
        
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
    // Enables user to add a meal to favourites list if it doesn't already exist
    func addToFavourites(index: Int) {
        var favourites = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        var doesExist = false
        
        for favIndex in favourites {
            if favIndex == index {
                doesExist = true
            }
        }
        
        if !doesExist {
            favourites.append(index)
            UserDefaults.standard.set(favourites, forKey: "favourites")
        }
        
        viewDidLoad()
    }
    
    // Enables removing a meal from the favourites list if it actually exists
    func removeFromFacourites(index: Int) {
        var favourites = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        favourites.removeAll{$0 == index}
        UserDefaults.standard.set(favourites, forKey: "favourites")
        
        viewDidLoad()
    }
    
    // Return a list of current favourite meals
    func getFavourites() -> [Meal] {
        var favourites = [Meal]()
        let favIndex: [Int] = UserDefaults.standard.array(forKey: "favourites") as? [Int] ?? [Int]()
        
        for index in favIndex {
            favourites.append(meals[index])
        }
        
        return favourites
    }
    
    // Adds the meals in shopping cart to the This Week list if it doesn't already exist
    func addToThisWeek(index: Int) {
        var thisWeek = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        var doesExist = false
        
        for thisWeekIndex in thisWeek {
            if thisWeekIndex == index {
                doesExist = true
            }
        }
        
        if !doesExist {
            thisWeek.append(index)
            UserDefaults.standard.set(thisWeek, forKey: "thisWeek")
        }
        
        viewDidLoad()
    }
    
    // Removes selected meals from the This Week list if it exists
    func removeFromThisWeek(index: Int) {
        var thisWeek = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        thisWeek.removeAll{$0 == index}
        UserDefaults.standard.set(thisWeek, forKey: "thisWeek")
        
        viewDidLoad()
    }
    
    // Return a list of current favourite meals
    func getThisWeek() -> [Meal] {
        var thisWeek = [Meal]()
        let thisWeekIndex: [Int] = UserDefaults.standard.array(forKey: "thisWeek") as? [Int] ?? [Int]()
        
        for index in thisWeekIndex {
            thisWeek.append(meals[index])
        }
        
        return thisWeek
    }
    
    // Initial setup of the side menu
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuVC()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    // These functions below hide the current controller and show their respective instances instead

    func showHomeController() {
        if currentController != UINavigationController(rootViewController: homeController) {
            if currentController != nil {
                currentController.view.removeFromSuperview()
            }
            
            currentController = UINavigationController(rootViewController: homeController)
            view.addSubview(currentController.view)
            addChild(currentController)
            currentController.didMove(toParent: self)
            homeController.global = self
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
            weekController.global = self
            weekController.configureUI()
            weekController.meals = getThisWeek()
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
            mealsController.global = self
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
            shoppingController.global = self
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
            favouritesController.global = self
            favouritesController.configureUI()
        }
    }

    // Animates the side menu controller in to view, moving the current controller + navigation to the side
    func showMenuController(shouldExpand: Bool, menuOption: MenuOptionValues?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.currentController.view.frame.origin.x = self.currentController.view.frame.width - 160
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.currentController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
            
            animateStatusBar()
        }
    }
    
    // Shows the recipe for a meal when the meal is clicked, slides up in to view
    func showMealDetails(mealID: Int) {
        let currentMeal = self.meals[mealID] as Meal

        mealDetailsController.NavigationTitle?.title = currentMeal.title
        self.present(mealDetailsController, animated: true, completion: nil)
        
                
        mealDetailsController.MealImage.image = currentMeal.image
    }
    
    // Switch to handle menu selections, displays selected controller
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

// Handle the side menu selection
extension GlobalVC: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOptionValues?) {
        if !isMenuExpanded {
            configureMenuController()
        }
        
        isMenuExpanded = !isMenuExpanded
        showMenuController(shouldExpand: isMenuExpanded, menuOption: menuOption)
    }
}
