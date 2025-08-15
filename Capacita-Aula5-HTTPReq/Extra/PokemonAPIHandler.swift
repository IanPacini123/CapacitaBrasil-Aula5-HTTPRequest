//
//  PokemonAPIHandler.swift
//  Capacita-Aula5-HTTPReq
//
//  Created by Ian Pacini on 13/08/25.
//

import Foundation

@Observable
class PokemonAPIHandler {
    var pokemonList: PokemonList?
    
    func getPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0") else {
            fatalError("Não consegui pegar lista de pokemons")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, errorAPI) in
            if errorAPI != nil {
                print("Deu errado pegar a lista de pokemon")
                return
            }
            
            guard let _ = response as? HTTPURLResponse else {
                print("Deu errado pegar a response")
                return
            }
            
            guard let data = data else {
                print("Deu errado pegar os dados da API")
                return
            }
            
            Task {
                do {
                    let decodedData = try JSONDecoder().decode(PokemonList.self, from: data)
                    self.pokemonList = decodedData
                } catch {
                    print(error)
                    print("Deu errado decodificar os dados da API")
                }
            }
        }
        
        dataTask.resume()
    }
    
    func newGetPokemonList() async throws -> PokemonList {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0") else {
            fatalError("Não consegui pegar lista de pokemons")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(PokemonList.self, from: data)
    }
    
    func getPokemon(url: String) async throws -> Pokemon {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}
