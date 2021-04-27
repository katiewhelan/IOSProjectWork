//
//  MainSplitViewController.swift
//  DemoDirectory
//
//  Created by Vladislav Fitc on 09/06/2020.
//  Copyright © 2020 Algolia. All rights reserved.
//

import Foundation
import UIKit

class MainSplitViewController: UISplitViewController {
  
  let collectionListNavigationController: UINavigationController
  let collectionListViewController: CollectionListViewController
 // let demoFactory: CoFactory
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    print("START HERE")
    collectionListViewController = .init()
   // demoFactory = .init()
    collectionListNavigationController = UINavigationController(rootViewController: collectionListViewController)
    collectionListNavigationController.navigationBar.prefersLargeTitles = true
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    preferredDisplayMode =
    collectionListViewController.title = "Collection"
    collectionListViewController.delegate = self
    viewControllers = [collectionListNavigationController]
  }
  
}


extension MainSplitViewController: CollectionListViewControllerDelegate {
  
  func collectionListViewController(_ collectionListViewController: CollectionListViewController, didSelect demo: Collectzion) {
    print("ROW SELECTED ")
  

  }
  
}
