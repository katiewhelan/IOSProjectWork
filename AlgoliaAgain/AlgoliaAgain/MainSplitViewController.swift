//
//  MainSplit.swift
//  AlgoliaAgain
//
//  Created by Kathryn Whelan on 3/11/21.
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
    //do {
//      let viewController = try demoFactory.viewController(for: demo)
//      let navigationController = UINavigationController(rootViewController: viewController)
//      showDetailViewController(navigationController, sender: self)
//    } catch let error as DemoFactory.Error {
//      switch error {
//      case .demoNotImplemented:
//            let notImplementedAlertController = UIAlertController(title: nil, message: "This demo is not implemented yet", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: .none)
//            notImplementedAlertController.addAction(okAction)
//            present(notImplementedAlertController, animated: true, completion: .none)
//      }
//    } catch let error {
//      print("\(error)")
//    }

  }
  
}
