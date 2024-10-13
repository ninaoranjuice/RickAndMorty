//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//
import Foundation
import UIKit

protocol MainViewModelProtocol {
    func allCharacters(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func heightForRowAt() -> CGFloat
    func didSelectItemAt(_ index: Int)
}

class MainViewModel: MainViewModelProtocol {
    
    private let request = Requests()
    private var characters: [Hero] = []
    private var currentPage: Int = 1
    private var morePages = true
    private var isLoading = false
    var coordinator: Coordinator?
    
    func allCharacters(completion: @escaping () -> Void) {
        guard morePages && !isLoading else { return }
        
        request.allCharacters(page: currentPage) { [weak self] newHeroes in
            
            if newHeroes.isEmpty {
                self?.morePages = false
            } else {
                self?.characters.append(contentsOf: newHeroes)
                self?.currentPage += 1
            }
            self?.isLoading = false
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return characters.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell
        let character = characters[indexPath.row]
        cell?.name.text = character.name
        cell?.gender.text = character.gender
        if let image = character.image, let imageURL = URL(string: image) {
            let image = UIImage(named: "unknown")
            cell?.image.af.setImage(withURL: imageURL, placeholderImage: image) } else {
                print("Ошибка загрузки изображения.")
            }
        return cell ?? UITableViewCell()
    }
    
    func heightForRowAt() -> CGFloat {
        return 150
    }
    
    func didSelectItemAt(_ index: Int) {
        let character = characters[index]
        if let id = character.id {
            coordinator?.showDetail(id: id)
        }
    }
}
