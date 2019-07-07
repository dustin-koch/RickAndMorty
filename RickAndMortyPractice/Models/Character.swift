//
//  Character.swift
//  RickAndMortyPractice
//
//  Created by Dustin Koch on 7/7/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    let name: String
    let status: String
    let origin: Origin
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case status
        case origin
        case image
    }
    
}//END OF STRUCT

struct TopLevelDictionary: Codable {
    
    let results = [Character]
    
}//END OF STRUCT

struct Origin: Codable {
    
    let planetName: String
    
    enum CodingKeys: String, CodingKey {
        case planetName = "name"
    }
    
}//END OF STRUCT
