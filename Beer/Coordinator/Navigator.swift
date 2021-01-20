//
//  Coordinator.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//
import Foundation
import UIKit

import RxCocoa

class Navigator {
  lazy private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)

  // MARK: - segues list
  enum Segue {
    case listBeer
    case detailBeer(beer: BeerModel)
  }

  // MARK: - invoke a single segue
  func show(segue: Segue, sender: UIViewController) {
    switch segue {

    case .listBeer:
      let vm = ListBeerViewModel()
      show(target: ListBeerViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: sender)

    case .detailBeer(beer: let beer):
      let vm = DetailBeerViewModel(beer: beer)
      show(target: DetailBeerViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: sender)

    }
  }
    
   

  private func show(target: UIViewController, sender: UIViewController) {
    if let nav = sender as? UINavigationController {
      //push root controller on navigation stack
      nav.pushViewController(target, animated: false)
      return
    }

    if let nav = sender.navigationController {
      //add controller to navigation stack
      nav.pushViewController(target, animated: true)
    } else {
      //present modally
      sender.present(target, animated: true, completion: nil)
    }
  }
}
