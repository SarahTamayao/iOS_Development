//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Linni Cai on 9/27/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let baseUrl = "https://image.tmdb.org/t/p/"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + "w185" + posterPath)
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseUrl + "w780" + backdropPath)
        
        poster.af.setImage(withURL: posterUrl!)
        backdrop.af.setImage(withURL: backdropUrl!)
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        content.text = movie["overview"] as? String
        content.sizeToFit()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
