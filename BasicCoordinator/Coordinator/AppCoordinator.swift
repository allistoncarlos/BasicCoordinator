//
//  AppCoordinator.swift
//  BasicCoordinator
//
//  Created by Alliston Aleixo on 30/11/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = FirstViewController(coordinator: self)
        viewController.title = "First Screen"
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToSecondScreen() {
        let viewController = SecondViewController(coordinator: self)
        viewController.title = "Second Screen"
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToHome() {
        navigationController.popToRootViewController(animated: true)
    }
}
