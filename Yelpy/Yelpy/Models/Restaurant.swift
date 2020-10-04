//
//  Restaurant.swift
//  Yelpy
//
//  Created by LINNI on 10/3/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation

class Restaurant {
    // establish properties
    var imageURL: URL?
    var url: URL?
    var name: String
    var phone: String
    var rating: Double
    var reviews: Int
    var mainCategory: String
    
    // complete initializer for restaurant
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
    }
    
    // helper function to get first category from restaurant
    static func getMainCategory(dict: [String: Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }
}
