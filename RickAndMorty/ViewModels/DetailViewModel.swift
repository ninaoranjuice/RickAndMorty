//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    func detailCharacter(completion: @escaping () -> Void)
}

class DetailViewModel: DetailViewModelProtocol {
    
    private let request: Requests
    private var character: HeroDetail?
    private var id: Int
    
    init(request: Requests, id: Int) {
        self.request = request
        self.id = id
    }
    
    func detailCharacter(completion: @escaping () -> Void) {
        
        request.detailCharacter(id: id) { detailHero in
            self.character = detailHero
            completion()
        }
    }
    
    func getCharacter() -> HeroDetail? {
        return character
    }
}
