//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by LINNI on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorite: Bool = false
    var retweeted: Bool = false
    var tweetId: Int = -1
    
    @IBAction func retweetAction(_ sender: Any) {
        let toBeRetweeted = !retweeted
        print("toBeRetweeted:", toBeRetweeted)
        if (toBeRetweeted) {
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Retweet did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Unretweet did not succeed: \(error)")
            })
        }
        
    }
    
    @IBAction func favAction(_ sender: Any) {
        let toBeFavorite = !favorite
        if (toBeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: {(error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        retweeted = isRetweeted
        print("retweeted:", retweeted)
        if (retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
//            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
//            retweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorite: Bool) {
        favorite = isFavorite
        if (favorite) {
            favButton.setImage(UIImage(named: "favor-icon-red"),
                               for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"),
                               for: UIControl.State.normal)
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
