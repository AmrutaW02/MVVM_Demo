//
//  ListModel.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import Foundation

struct CategoryModel: Codable {
    var resultCount: Int?
    var results: [ListModel]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}

struct ListModel : Codable {

    var artistID, collectionID, amgArtistID: Int?
    var artistName : String?
    var artworkUrl100: String?


    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName = "artistName"
        case artworkUrl100 = "artworkUrl100"
    }
}
