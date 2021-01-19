//
//  Coordinator.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//
import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}

}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow


    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let navigationController = UINavigationController()

        let beerListCoordinator = BeerListCoordinator(navigationController: navigationController)

        beerListCoordinator.start()

        childCoordinators.append(beerListCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
