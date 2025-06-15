import SwiftUI

struct ListaPokemonView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    @Binding var usuario: Usuario
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 20)]) {
                ForEach(viewModel.pokemons, id: \.name) { poke in
                    Button {
                        coordinator.next(route: .detalhes(nome: poke.name, usuario: usuario))
                    } label: {
                        VStack {
                            Text(poke.name.capitalized)
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Pokémons")
        .onAppear {
            viewModel.carregarPokemons()
        }
    }
}
