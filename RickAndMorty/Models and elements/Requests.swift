//
//  Requests.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//
import UIKit
import AlamofireImage

class Requests {
    
    func allCharacters(page: Int, completion: @escaping ([Hero]) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        guard let url = URL(string: urlString) else {
            print("Некорректный адрес.")
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {
                print("Данные отсутствуют.")
                completion([])
                return
            }
            let heroResponse = try? JSONDecoder().decode(HeroResponse.self, from: data)
            print("Запрос успешно выполнился.")
            completion(heroResponse?.results ?? [])
        }
        .resume()
    }
    
    func detailCharacter(id: Int, completion: @escaping (HeroDetail?) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character/\(id)"
        guard let url = URL(string: urlString) else {
            print("Некорректный адрес.")
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                let character = try? JSONDecoder().decode(HeroDetail.self, from: data)
                completion(character ?? nil)
            }
        }.resume()
    }
}
