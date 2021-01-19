//
//  BeerListCoordinator.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import UIKit

final class BeerListCoordinator: Coordinator{
    private(set)  var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController  = navigationController
    }
    
    func start() {
        let beerListController: BeerListViewController = .instantiate()
        navigationController.setViewControllers([beerListController], animated: false)
    }
    
    func onSelect(_ selectBeer: BeerModel){
        let beerDetailCoordinator = BeerDetailCoordinator(beer: selectBeer, navigationController: navigationController)
        childCoordinators.append(beerDetailCoordinator)
        beerDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {

        if let index = childCoordinators.firstIndex(where: { (coordinator) -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    
    
}
