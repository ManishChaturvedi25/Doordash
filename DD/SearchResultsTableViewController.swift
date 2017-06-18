//
//  SearchResultsViewControllerController.swift
//  DD
//
//  Created by ctsuser1 on 5/9/17.
//  Copyright © 2017 ManishChaturvedi. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lat: Double!
    var lng: Double!
    
    let searchController = UISearchController(searchResultsController: nil)

    let dataSource = SearchResultsDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsTableViewController.dismissSearchResultController))
        
        tableView.tableHeaderView = searchController.searchBar
        tableView.dataSource = dataSource
        
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        
        
        let apiClient = DoorDashAPIClient()

        apiClient.searchForNearestResturants(withLat: ViewController.lat, lng: ViewController.lng) {resturants, error in
            
            if let dataSource = self.tableView.dataSource as? SearchResultsDataSource {
                DispatchQueue.main.async {
                    dataSource.updateDataSource(data: resturants)
                    self.tableView.reloadData()
                }
            }
            
            
        }

       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMenu" {
            if let selectedindexPath = tableView.indexPathForSelectedRow {
                let selectedResturant = dataSource.resturant(indexPath: selectedindexPath)
                
                let resturantDetailController  = segue.destination as! ResultsDetailViewController
                
                resturantDetailController.resturant = selectedResturant
                
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissSearchResultController(){
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func DismissSearchView(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.00
    }
    
}

extension SearchResultsTableViewController : UISearchResultsUpdating {
    
    // TODO : Handle search here.
    func updateSearchResults(for searchController: UISearchController) {
        

        tableView.reloadData()
        print(searchController.searchBar.text!)
    }
}

