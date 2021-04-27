//
//  MovieTableViewCell.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit

class CollectionTableViewCell: UITableViewCell, CollectionCell {
    let collectionName: UILabel
    let collectionType: UILabel
    let userId: UILabel
    let artworkImageView: UIImageView

  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    //print("MOVIETABLEVIEWCELL override ")
    artworkImageView = .init(frame: .zero)
    collectionName = .init(frame: .zero)
    collectionType = .init(frame: .zero)
    userId = .init(frame: .zero)
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
  //  print("MOVIETABLEVIEWCELL private Layout ")
    artworkImageView.translatesAutoresizingMaskIntoConstraints = false
    artworkImageView.clipsToBounds = true
    artworkImageView.contentMode = .scaleAspectFill
    artworkImageView.layer.masksToBounds = true
//
    collectionName.translatesAutoresizingMaskIntoConstraints = false
    collectionName.font = .systemFont(ofSize: 12, weight: .bold)
    collectionName.numberOfLines = 0
    
    collectionType.translatesAutoresizingMaskIntoConstraints = false
    collectionType.font = .systemFont(ofSize: 10, weight: .regular)
    collectionType.textColor = .gray
    collectionType.numberOfLines = 0
    
    userId.translatesAutoresizingMaskIntoConstraints = false
    userId.font = .systemFont(ofSize: 10, weight: .regular)
    userId.textColor = .gray
    userId.numberOfLines = 0
    
    let mainStackView = UIStackView()
    mainStackView.axis = .horizontal
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    mainStackView.spacing = 5
    
    let labelsStackView = UIStackView()
    labelsStackView.axis = .vertical
    labelsStackView.translatesAutoresizingMaskIntoConstraints = false
    labelsStackView.spacing = 3
    
    labelsStackView.addArrangedSubview(collectionName)
    labelsStackView.addArrangedSubview(collectionType)
    labelsStackView.addArrangedSubview(userId)
    labelsStackView.addArrangedSubview(UIView())
    
    let artworkImageContainer = UIView()
    artworkImageContainer.translatesAutoresizingMaskIntoConstraints = false
    artworkImageContainer.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    artworkImageContainer.addSubview(artworkImageView)
    artworkImageView.pin(to: artworkImageContainer.layoutMarginsGuide)
    
    mainStackView.addArrangedSubview(artworkImageContainer)
    mainStackView.addArrangedSubview(labelsStackView)
    
    contentView.addSubview(mainStackView)
    
    artworkImageView.widthAnchor.constraint(equalTo: artworkImageView.heightAnchor).isActive = true
    
    mainStackView.pin(to: contentView)
  }
  
}
