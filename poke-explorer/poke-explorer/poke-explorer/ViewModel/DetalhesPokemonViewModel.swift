//
//  DetalhesPokemonViewModel.swift
//  poke-explorer
//
//  Created by user276492 on 6/13/25.
//


import Foundation

class DetalhesPokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var erro: String?
    
    func carregarDetalhes(nome: String) {
        print("Carregando detalhes de: \(nome)")
        PokemonAPIService.shared.fetchPokemonDetails(for: nome) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let poke):
                    self.pokemon = poke
                case .failure(let error):
                    self.erro = error.localizedDescription
                }
            }
        }
    }
    
    func favoritar(usuario: Usuario) {
        guard let poke = pokemon else { return }
        FavoritoService.shared.adicionarPokemonFavorito(pokemon: poke, usuario: usuario)
    }
    
    func desfavoritar(usuario: Usuario) {
        guard let poke = pokemon else { return }
        FavoritoService.shared.removerPokemonFavorito(idPokemon: poke.id, usuario: usuario)
    }

}
