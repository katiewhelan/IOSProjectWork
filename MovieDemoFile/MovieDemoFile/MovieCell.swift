//
//  MovieCell.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit

protocol MovieCell {
  
  var artworkImageView: UIImageView { get }
  var titleLabel: UILabel { get }
  var genreLabel: UILabel { get }
  var yearLabel: UILabel { get }
  
}
