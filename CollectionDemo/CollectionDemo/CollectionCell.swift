//
//  MovieCell.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit

protocol CollectionCell {
  
  var artworkImageView: UIImageView { get }
  var collectionName: UILabel { get }
  var collectionType: UILabel { get }
  var userId: UILabel { get }
  
}
