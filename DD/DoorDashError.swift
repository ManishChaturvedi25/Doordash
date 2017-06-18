//
//  DoorDashError.swift
//  DD
//
//  Created by ctsuser1 on 5/13/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import Foundation

enum DoorDashError:Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFaliure(errorMessage:String)
}
