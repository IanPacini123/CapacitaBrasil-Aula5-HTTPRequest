//
//  ContentView.swift
//  Capacita-Aula5-HTTPReq
//
//  Created by Ian Pacini on 13/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        if pokemonViewModel.pokemons.isEmpty {
            Button {
                pokemonViewModel.fetchPokemon()
            } label: {
                Text("Pegar lista de pokemons")
            }
        } else {
            ScrollView {
                VStack {
                    ForEach(pokemonViewModel.pokemons, id: \.id) { pokemon in
                        VStack {
                            AsyncImage(url: URL(string: pokemon.sprites.frontDefault ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                                    .border(.black)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            HStack {
                                Text("ID: \(pokemon.id)")
                                
                                Text(pokemon.name)
                            }
                            .padding()
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
