//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Linni Cai on 9/26/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantCell: UITableViewCell {


    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var restaurantRateImage: UIImageView!
    @IBOutlet weak var restaurantReviewNumber: UILabel!
    
    // add movie variable + didset
    var r: Restaurant! {
        didSet {
            restaurantName.text = r.name
            restaurantType.text = r.mainCategory
            restaurantPhone.text = r.phone
            restaurantReviewNumber.text = String(r.reviews) + " reviews"
            restaurantRateImage.image = Stars.dict[r.rating]!
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
