//
//  Restaurant.swift
//  DD
//
//  Created by ctsuser1 on 5/13/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import Foundation

class Restaurant {
    
    let id: Int
    let name: String
    let description: String
    let deliveryFee: Int
    let coverImgUrl: String
    let asapTime:Int
    
    init (id:Int, name:String, description: String, deliveryFee:Int,coverImgUrl:String,asapTime:Int){

        self.id = id
        self.name = name
        self.description = description
        self.deliveryFee = deliveryFee
        self.coverImgUrl = coverImgUrl
        self.asapTime = asapTime
    }
}

extension Restaurant {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let id = "id"
            static let name = "name"
            static let description = "description"
            static let delivery_fee = "delivery_fee"
            static let cover_img_url = "cover_img_url"
            static let asap_time = "asap_time"
            
        }
        
        guard let id = json[Key.id] as? Int,
            let name = json[Key.name] as? String,
            let description = json[Key.description] as? String,
            let deliveryFee = json[Key.delivery_fee] as? Int,
            let coverImgUrl = json[Key.cover_img_url] as? String else {
                return nil
        }
        
        var asapTime = json[Key.asap_time] as? Int
        if asapTime == nil {
            asapTime = 0
        }
        
        self.init(id: id, name: name, description: description,deliveryFee:deliveryFee, coverImgUrl:coverImgUrl, asapTime:asapTime!)
    }
}


/*
 
 - important fields:
 - id: primary key
 - name: name of the store
 - description: description of the store
 - delivery_fee: the cost of delivery, in cents
 - cover_img_url: URL to icon image of the store
 - asap_time: estimated delivery time, in minutes

 
 */
