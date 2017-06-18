//
//  DoorDashAPIClient.swift
//  DD
//
//  Created by ctsuser1 on 5/14/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import Foundation

class DoorDashAPIClient {
    let downloader = JSONDownloader()
    
    func searchForNearestResturants(withLat lat:Double, lng:Double, completionHandler : @escaping ([Restaurant], DoorDashError?)->Void ){
        
        let searchUrl = self.constructResturantFetchUrlFrom(lat: lat,lng:lng)
        
        let searchRequest = URLRequest(url: searchUrl)
        
        let task = downloader.jsonTask(with: searchRequest){ json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completionHandler([], error)
                    return
                }
            }
            guard let actorsJSON = json else {
                return
            }
            
            let resturant = actorsJSON.flatMap{ Restaurant(json: $0)}
            
            completionHandler(resturant, error)
        }
        
        task.resume()
        }
    
    func fetchMenuItems(resturantID id:Int, completionHandler : @escaping ([Menu], DoorDashError?) -> Void){
        let searchUrl  = self.constructMenuFetchUrlFrom(id: id)
        
        let searchRequest = URLRequest(url: searchUrl)

        let task = downloader.jsonTask(with: searchRequest){ json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completionHandler([], error)
                    return
                }
            }
            guard let actorsJSON = json else {
                return
            }
            
            let menuList = actorsJSON.flatMap{ Menu(json: $0)}
            
            completionHandler(menuList, error)
        }
        
        task.resume()
        
    }
    
    func constructResturantFetchUrlFrom(lat:Double, lng:Double)-> URL{

        let urlQueryItemLat = URLQueryItem(name: "lat", value: String(lat))
        let urlQueryItemLong = URLQueryItem(name: "lng", value: String(lng))
        var urlComps = URLComponents(string: "https://api.doordash.com")!
        urlComps.queryItems = [urlQueryItemLat,urlQueryItemLong]
        urlComps.path = "/v1/store_search/"
        let searchUrl = urlComps.url!
        return searchUrl
    }
    
    func constructMenuFetchUrlFrom(id:Int) ->URL{
        let urlString = "https://api.doordash.com/v2/restaurant/" +  "\(id)" + "/menu"
        
        let url = URL(string: urlString)
        
        return url!
        
    }
}
