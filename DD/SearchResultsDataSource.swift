//
//  SearchResultsDataSource.swift
//  DD
//
//  Created by ctsuser1 on 5/10/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject , UITableViewDataSource{

    var resturantList = [Restaurant] ()
    
    override init() {
        super.init()
    }

    func updateDataSource( data:[Restaurant]) {
        self.resturantList = data
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resturantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nearestAttractionCell = tableView.dequeueReusableCell(withIdentifier:NearestAttractionCell.reuseIdentified, for: indexPath) as! NearestAttractionCell
        
        let viewModel = SearchResultsViewModel(resturant: resturantList[indexPath.row])
        nearestAttractionCell.storeNameLabel.text = self.resturantList[indexPath.row].name
        nearestAttractionCell.specialityLabel.text = self.resturantList[indexPath.row].description
        nearestAttractionCell.deliveryTypeLabel.text = viewModel.deliveryFeeformattedValue
        nearestAttractionCell.asapLabel.text = viewModel.asapFormatterValue

        return nearestAttractionCell
        
    }

    // Mark- Helper method
    func resturant (indexPath: IndexPath) -> Restaurant{
        return resturantList[indexPath.row]
    }

    
}
