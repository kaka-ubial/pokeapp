import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [NamedAPIResource] = []
    @Published var erro: String?
    
    private var offset = 0
    private let limit = 20
    
    func carregarPokemons() {
        PokemonAPIService.shared.fetchPokemonList(limit: limit, offset: offset) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let novos):
                    self.pokemons.append(contentsOf: novos)
                    self.offset += self.limit
                case .failure(let error):
                    self.erro = error.localizedDescription
                }
            }
        }
    }
}
