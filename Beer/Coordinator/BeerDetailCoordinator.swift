//
//  BeerDetailCoordinator.swift
//  Beer
//
//  Created by Ian Pablo on 19/01/21.
//

import UIKit


final class BeerDetailCoordinator: Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: BeerListCoordinator?

    private let navigationController: UINavigationController
    private let beer: BeerModel
    
    init(beer: BeerModel,
        navigationController: UINavigationController){
        self.navigationController  = navigationController
        self.beer = beer
    }
    
    func start() {
        let beerDetailViewController: BeerDetailViewController  = .instantiate()
        beerDetailViewController.viewModel = BeerDetailViewModel(beer: beer)
        navigationController.pushViewController(beerDetailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { (coordinator) -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
