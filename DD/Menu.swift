//
//  Menu.swift
//  DD
//
//  Created by ctsuser1 on 5/13/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import Foundation

class MenuItem {
    let description:String
    let name: String
    
    init(description:String, name:String){
        self.description = description
        self.name = name
    }
    
}

class MenuCategories {
    let id: Int
    let title: String
    let items: [[String: Any]]
    
    init(id: Int, title:String, items:[[String: Any]]){
        self.id = id
        self.title = title
        self.items = items
    }
}

extension MenuCategories {
    
    convenience init?( json: [String: Any]) {
        
        struct Key {
            static let id = "id"
            static let title = "title"
            static let items = "items"
        }
        
        guard let id = json[Key.id] as? Int,
            let title = json[Key.title] as? String,
            let items = json[Key.items] as? [[String: Any]] else {
                return nil
        }
        
        self.init(id: id, title: title, items: items)
    }

}

class Menu {
    
    let id: Int
    let name : String
    let status: String
    let menuCategories : [[String: Any]]
    
    init(id:Int, name:String,status:String, menuCategories:[[String: Any]]){
        
        self.id = id
        self.name = name
        self.status = status
        self.menuCategories = menuCategories
    }
}

extension Menu {
    
    convenience init?( json: [String: Any]) {

        struct Key {
            static let id = "id"
            static let name = "name"
            static let status = "status"
            static let menuCategories = "menu_categories"
        }
        
        guard let id = json[Key.id] as? Int,
            let name = json[Key.name] as? String,
            let status = json[Key.status] as? String,
            let menuCategories = json[Key.menuCategories] as? [[String: Any]] else {
                return nil
        }
        
        self.init(id: id, name: name, status: status, menuCategories:menuCategories)
    }
   
}
    
    
    

/*
 
 - important fields:
 - id: primary key
 - name: the name of the menu
 - menu_categories: a list of categories within the menu. For example, an italian menu might have the following categories: Pizzas, Pastas, Seafood, etc.

 */
