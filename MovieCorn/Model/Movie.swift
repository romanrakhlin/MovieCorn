//
//  Movie.swift
//  MovieCorn
//
//  Created by Roman Rakhlin on 02.04.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let Poster: String?
    let Title: String?
    let Year: String?
    let Rated: String?
    let Released: String?
    let Runtime: String?
    let Genre: String?
    let Director: String?
    let Language: String?
    let Country: String?
    let BoxOffice: String?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    
    init?(json: [String: Any]) {
        guard
            let Poster = json["Poster"] as? String,
            let Title = json["Title"] as? String,
            let Year = json["Year"] as? String,
            let Rated = json["Rated"] as? String,
            let Released = json["Released"] as? String,
            let Runtime = json["Runtime"] as? String,
            let Genre = json["Genre"] as? String,
            let Director = json["Director"] as? String,
            let Language = json["Language"] as? String,
            let Country = json["Country"] as? String,
            let BoxOffice = json["BoxOffice"] as? String,
            let Metascore = json["Metascore"] as? String,
            let imdbRating = json["imdbRating"] as? String,
            let imdbVotes = json["imdbVotes"] as? String
        else { return nil }
        
        self.Poster = Poster
        self.Title = Title
        self.Year = Year
        self.Rated = Rated
        self.Released = Released
        self.Runtime = Runtime
        self.Genre = Genre
        self.Director = Director
        self.Language = Language
        self.Country = Country
        self.BoxOffice = BoxOffice
        self.Metascore = Metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
    }
}
