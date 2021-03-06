//
//  ResultsDetailViewController.swift
//  DD
//
//  Created by ctsuser1 on 5/12/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import UIKit
import AFNetworking

class ResultsDetailViewController: UITableViewController {


 
    var menu: Menu!
    var resturant: Restaurant!
    
    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var arrivalDetailsLabel: UILabel!
    
    @IBOutlet weak var favouriteButton: UIButton!
    
 
    let dataSource = FavouritesDataSource()

    
    override func viewDidLoad() {
        super.viewDidLoad()

         
        tableView.dataSource = dataSource
        let apiClient = DoorDashAPIClient()
        
        apiClient.fetchMenuItems(resturantID: self.resturant.id) { menuList, error in
            
        print(menuList);
        
        let imageUrl = URL(string: self.resturant.coverImgUrl)
            
        URLSession.shared.dataTask(with: imageUrl!, completionHandler: { (data, reposnse, error) in
            DispatchQueue.main.async(execute: {
                self.storeImageView.image = UIImage(data: data!)
                if let dataSource = self.tableView.dataSource as? FavouritesDataSource {
                    dataSource.updateDataSource(data: menuList)
                    self.tableView.reloadData()
                }
            })
        }).resume()
            
            
    }
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.arrivalDetailsLabel.text = resturant.description

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addToFavourite(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
