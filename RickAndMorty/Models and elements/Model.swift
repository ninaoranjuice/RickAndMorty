//
//  Model.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//
import Foundation

struct HeroResponse: Codable {
    let results: [Hero]
}

struct Hero: Codable {
    let name: String?
    let image: String?
    let gender: String?
    let id: Int?
}

struct HeroDetail: Codable {
    let name: String?
    let gender: String?
    let image: String?
    let type: String?
    let status: String?
    let species: String?
    let id: Int?
}


