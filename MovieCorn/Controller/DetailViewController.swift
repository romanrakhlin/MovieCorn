//
//  DetailViewController.swift
//  MovieCorn
//
//  Created by Roman Rakhlin on 01.04.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UITableViewController {

    // Main Info
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // About
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var boxofficeLabel: UILabel!
    
    // Ratings
    @IBOutlet weak var metascoreLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var imdbVotes: UILabel!
    
    private var Info: Movie!

    var imdbID: String!
    let link = "http://www.omdbapi.com/?i="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        
        let url = link + imdbID + "&apikey=964c38ef"
        
        AF.request(url).validate().responseData { (response) in
            
            switch response.result {
            case .success(let value):
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: value)
                    self.Info = movie
                    
                    DispatchQueue.main.async {
                        if self.Info.Poster != nil {
                            let poster = self.Info.Poster!
                            AF.request("\(poster)").responseData { (response) in
                                switch response.result {
                                case .success(let value):
                                   self.posterView.image = UIImage(data: value)
                                case .failure(_):
                                    self.posterView.image = UIImage(named: "Unknown")
                                }
                            }
                        }
                        
                        if self.Info.Title != nil {
                            self.titleLabel.text = self.Info.Title!
                        }
                        
                        if self.Info.Year != nil {
                            self.yearLabel.text = self.Info.Year!
                        }
                        
                        if self.Info.Rated != nil {
                            self.rateLabel.text = self.Info.Rated!
                        }
                        
                        if self.Info.Released != nil {
                            self.releasedLabel.text = self.Info.Released!
                        }
                        
                        if self.Info.Runtime != nil {
                            self.runtimeLabel.text = self.Info.Runtime!
                        }
                        
                        if self.Info.Genre != nil {
                            self.genreLabel.text = self.Info.Genre!
                        }
                        
                        if self.Info.Director != nil {
                            self.directorLabel.text = self.Info.Director!
                        }
                        
                        if self.Info.Language != nil {
                            self.languageLabel.text = self.Info.Language!
                        }
                        
                        if self.Info.Country != nil {
                            self.countryLabel.text = self.Info.Country!
                        }
                        
                        if self.Info.BoxOffice != nil {
                            self.boxofficeLabel.text = self.Info.BoxOffice!
                        }
                        
                        if self.Info.Metascore != nil {
                            self.metascoreLabel.text = self.Info.Metascore!
                        }
                        
                        if self.Info.imdbRating != nil {
                            self.imdbLabel.text = self.Info.imdbRating!
                        }
                        
                        if self.Info.imdbVotes != nil {
                            self.imdbVotes.text = self.Info.imdbVotes!
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
