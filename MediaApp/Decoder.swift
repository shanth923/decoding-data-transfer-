//
//  Decoder.swift
//  MediaApp
//
//  Created by R Shantha Kumar on 12/3/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import Foundation
struct Movie:Codable {
   
    var posters:[String]?
    var songs:[String]?
    var trailers:[String]?
    var title:String?
    var story:String?
    var director:String?
    var actors:[String]?
    
  
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            actors = try values.decodeIfPresent([String].self, forKey: .actors)
            director = try values.decodeIfPresent(String.self, forKey: .director)
            posters = try values.decodeIfPresent([String].self, forKey: .posters)
            songs = try values.decodeIfPresent([String].self, forKey: .songs)
            story = try values.decodeIfPresent(String.self, forKey: .story)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            trailers = try values.decodeIfPresent([String].self, forKey: .trailers)
    }
    
    
    
    
}
