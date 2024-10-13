//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tableView = UITableView()
    private let stackView = UIStackView()
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        viewModel.allCharacters() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        view.backgroundColor = .black
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.addArrangedSubview(tableView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return viewModel.didSelectItemAt(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height - 20 {
            viewModel.allCharacters {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

