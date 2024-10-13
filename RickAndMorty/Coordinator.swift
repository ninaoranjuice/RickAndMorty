//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Нина  on 13.10.2024.
//
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
}

class Coordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func showDetail(id: Int) {
        let detailViewModel = DetailViewModel(request: Requests(), id: id)
        let detailViewController = DetailViewController(viewModel: detailViewModel, id: id)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}

