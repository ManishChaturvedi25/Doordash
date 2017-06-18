//
//  FavouritesDataSource.swift
//  DD
//
//  Created by ctsuser1 on 5/12/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import UIKit

class FavouritesDataSource: NSObject, UITableViewDataSource {

    private var menuItems = [Menu] ()
    private var menuCategoriesList = [MenuCategories] ()

    override init() {
        super.init()
    }

    func updateDataSource( data:[Menu]) {
        self.menuItems = data
        
        for menu in self.menuItems {
            if menu.status == "Available now" {
                if let menuCategories = menu.menuCategories as? [[String:Any]] {
                    for menuCategory in menuCategories {
                        if let menuCat = MenuCategories(json: menuCategory){
                            menuCategoriesList.append(menuCat)
                        }
                        
                    }
                    
                }
            }
            
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuCategoriesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favouriteItemCell = tableView.dequeueReusableCell(withIdentifier:FavouriteItemCell.reuseIdentified, for: indexPath) as! FavouriteItemCell
        
        //let menuCategories = self.menuItems[indexPath.row].menuCategories as? [[String:Any]]
        
        
        
       favouriteItemCell.menuCategoryNameLabel.text  = self.menuCategoriesList[indexPath.row].title
        
        return favouriteItemCell
        
    }

    
}
