//
//  FavouritesVC.swift
//  Recipe App
//
//  Created by Steve on 6/6/20.
//  Copyright © 2020 JSSK. All rights reserved.
//

import Foundation
import UIKit

class FavouritesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Properties
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var delegate: HomeControllerDelegate?
    
    var global: GlobalVC = GlobalVC()
    var meals: [Meal] = [Meal]()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        global.load()
        
        configureUI()
        
        meals = global.meals
        
        print(meals.count)
    //collectionView.delegate = self
    //collectionView.dataSource = self
        
        /*let itemSize = UIScreen.main.bounds.width/2 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        CollectionView.collectionViewLayout = layout*/
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
            delegate?.handleMenuToggle(forMenuOption: MenuOptionValues.Favourites)
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "Favourites"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
          return meals.count
        
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavoriteViewCell
        
       let meal = meals[indexPath.row]
        
        cell.FavoriteImage.image = meal.image
        cell.FavoriteLabel.text = meal.title
        
        return cell
        
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print(indexPath.row)
    }*/
}
