//
//  Movie.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation

struct Movie: Codable {
  let title: String
  let year: Int
  let image: URL
  let genre: [String]
}
