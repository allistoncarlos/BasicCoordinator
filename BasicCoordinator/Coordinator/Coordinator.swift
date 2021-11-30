//
//  Coordinator.swift
//  BasicCoordinator
//
//  Created by Alliston Aleixo on 30/11/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func navigateToSecondScreen()
    func navigateToHome()
}
