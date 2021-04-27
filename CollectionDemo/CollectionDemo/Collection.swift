//
//  Movie.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation

struct Collection: Codable {
  let collectionName: String
  let collectionType: String?
  let imageURL: URL
  let userId: String
}
