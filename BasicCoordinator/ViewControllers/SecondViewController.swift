//
//  SecondViewController.swift
//  BasicCoordinator
//
//  Created by Alliston Aleixo on 30/11/21.
//

import UIKit

class SecondViewController: UIViewController, UIViewControllerConfigurable, Coordinatable {
    // MARK: - Properties
    var coordinator: Coordinator
    
    // MARK: - Views
    var button: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.setTitle("Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureConstraints()
    }

    // MARK: - Protocol Funcs
    func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
    }
    
    func configureConstraints() {
        let buttonConstraints = [
            button.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            button.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            button.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            button.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    // MARK: - Actions
    @objc func buttonTapped() {
        let alertController = UIAlertController(title: "It works!", message: "Yeah, it does...", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: actionHandler))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func actionHandler(alert: UIAlertAction){
        coordinator.navigateToHome()
    }
}

