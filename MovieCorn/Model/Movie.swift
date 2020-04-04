//
//  MovieDescription.swift
//  MovieCorn
//
//  Created by Roman Rakhlin on 02.04.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let Title: String?
    let Director: String?
    
    init?(json: [String: Any]) {
        guard let Title = json["Title"] as? String, let Director = json["Director"] as? String else { return nil }
        
        self.Title = Title
        self.Director = Director
    }
}
