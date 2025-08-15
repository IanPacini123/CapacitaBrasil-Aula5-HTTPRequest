//
//  PokemonList.swift
//  Capacita-Aula5-HTTPReq
//
//  Created by Ian Pacini on 13/08/25.
//

import Foundation

struct PokemonList: Codable {
    var count: Int
    var results: [PokemonLink]
}

struct PokemonLink: Codable, Hashable {
    var name: String
    var url: String
}
