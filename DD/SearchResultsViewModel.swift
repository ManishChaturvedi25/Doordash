//
//  SearchResultsViewModel.swift
//  DD
//
//  Created by ctsuser1 on 5/15/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import Foundation

struct SearchResultsViewModel {
    
    let deliveryFeeformattedValue : String
    let asapFormatterValue : String
    
}

extension SearchResultsViewModel {
    
    init(resturant:Restaurant) {
        if resturant.deliveryFee == 0 {
            self.deliveryFeeformattedValue = "Free Delivery"
        }else {
            
            let deliveryChargeDoubleValue = "$\(resturant.deliveryFee/100).\(resturant.deliveryFee%100)"
            
            self.deliveryFeeformattedValue = deliveryChargeDoubleValue
        }
        
            self.asapFormatterValue = "\(resturant.asapTime) mins"
    }
}
