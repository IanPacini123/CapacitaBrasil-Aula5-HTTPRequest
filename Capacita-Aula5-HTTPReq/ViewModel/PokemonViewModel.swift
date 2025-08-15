//
//  PokemonViewModel.swift
//  Capacita-Aula5-HTTPReq
//
//  Created by Ian Pacini on 13/08/25.
//

import Foundation

@Observable
class PokemonViewModel {
    var pokemons: [Pokemon] = []
    
    func fetchPokemon() {
        let apiHandler = PokemonAPIHandler()
        
        Task {
            do {
                let pokemonList = try await apiHandler.newGetPokemonList()
                
                for pokemonLink in pokemonList.results {
                    let apiPokemon = try await apiHandler.getPokemon(url: pokemonLink.url)
                    pokemons.append(apiPokemon)
                }
            } catch {
                fatalError("Não consegui pegar algum pokemon da API")
            }
        }
    }
}
