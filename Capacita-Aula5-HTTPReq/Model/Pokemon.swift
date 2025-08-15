//
//  Pokemon.swift
//  Capacita-Aula5-HTTPReq
//
//  Created by Ian Pacini on 13/08/25.
//

struct Pokemon: Codable {
    var id: Int
    var name: String
    var sprites: Sprites
}

struct Sprites: Codable {
    var frontDefault: String?
    var frontShiny: String?
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "fronty_shiny"
    }
}
