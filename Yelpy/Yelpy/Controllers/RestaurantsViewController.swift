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
    var restaurantsArray: [[String: Any?]] = []
    
    // Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPIData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // Get data from API helper and retrieve restaurants
    func getAPIData() {
//        API.getRestaurants(completion: <#T##([[String : Any]]?) -> Void#>)
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
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
        
        // set restaurant name for each cell
        cell.restaurantName.text = restaurant["name"] as? String ?? ""
        
        // set restaurant type for each cell
        let categories = restaurant["categories"] as! [[String: Any]]
        let firstCategory = categories[0]
        let firstCategoryTitle = firstCategory["title"] as! String
        cell.restaurantType.text = firstCategoryTitle
        
        // set restaurant phone for each cell
        let phone = restaurant["display_phone"] as! String
        cell.restaurantPhone.text = phone
        
        // set restaurant rate for each cell
        let rate = restaurant["rating"] as! Float
        var rateImageName = ""
        if (rate < 1) {
            rateImageName = "small_0"
        } else if (rate == 1) {
            rateImageName = "small_1"
        } else if (rate < 2) {
            rateImageName = "small_1_half"
        } else if (rate == 2) {
            rateImageName = "small_2"
        } else if (rate < 3) {
            rateImageName = "small_2_half"
        } else if (rate == 3) {
            rateImageName = "small_3"
        } else if (rate < 4) {
            rateImageName = "small_3_half"
        } else if (rate == 4) {
            rateImageName = "small_4"
        } else if (rate < 5) {
            rateImageName = "small_4_half"
        } else if (rate == 5) {
            rateImageName = "small_5"
        }
        cell.restaurantRateImage.image = UIImage(named: rateImageName)
        
        // set restaurant review number for each cell
        let reviewNumber = restaurant["review_count"] as! Int
        cell.restaurantReviewNumber.text = String(reviewNumber)

        // set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        return cell
    }
    

}
