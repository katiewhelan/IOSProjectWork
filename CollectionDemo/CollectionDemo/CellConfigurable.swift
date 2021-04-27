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
    
    typealias Model = Collection
    
    let movie: Collection
    
    init(model: Collection, indexPath: IndexPath) {
        self.movie = model
    }
    
}

struct MovieCellViewState {
    
    func configure(_ cell: UIView & CollectionCell) -> (Collection) -> () {
        // print("DIDI THIS GET USED ")
        return { movie in
            cell.artworkImageView.sd_setImage(with: movie.imageURL) { (_, _, _, _) in
                DispatchQueue.main.async {
                cell.setNeedsLayout()
            }
            cell.collectionName.text = movie.collectionName
            cell.collectionType.text = movie.collectionType
            cell.userId.text = movie.userId
        }
    }
}
}



