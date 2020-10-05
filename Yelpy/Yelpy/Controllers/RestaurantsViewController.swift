//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    
    // place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    // Configure the API and initialize restaurantsArray
    var restaurantsArray: [Restaurant] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let r = restaurantsArray[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
    }
    
    // Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPIData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
//            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    // Create tableView Extension and TableView Functionality
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.r = restaurant

        return cell
    }
    

}
