//
//  NearestAttractionCell.swift
//  DD
//
//  Created by ctsuser1 on 5/10/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import UIKit

class NearestAttractionCell: UITableViewCell {

    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var specialityLabel: UILabel!

    @IBOutlet weak var deliveryTypeLabel: UILabel!
    
    @IBOutlet weak var asapLabel: UILabel!
    
    static let reuseIdentified = "NearestAttraction"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
