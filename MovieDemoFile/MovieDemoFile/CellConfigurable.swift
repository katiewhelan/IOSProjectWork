//
//  CellConfigurable.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import SDWebImage
import InstantSearch

struct MovieTableViewCellConfigurator: InstantSearch.CellConfigurable {
  
  static var cellIdentifier: String = "movieCell"
  
  typealias Model = Movie
  
  let movie: Movie
  
  init(model: Movie, indexPath: IndexPath) {
    self.movie = model
  }

}

struct MovieCellViewState {
 
  func configure(_ cell: UIView & MovieCell) -> (Movie) -> () {
   // print("DIDI THIS GET USED ")
    return { movie in
      cell.artworkImageView.sd_setImage(with: movie.image) { (_, _, _, _) in
        DispatchQueue.main.async {
          cell.setNeedsLayout()
        }
      }
      cell.titleLabel.text = movie.title
      cell.genreLabel.text = movie.genre.joined(separator: ", ")
      cell.yearLabel.text = String(movie.year)
    }
  }
}





