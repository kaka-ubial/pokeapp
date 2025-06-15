import SwiftUI

struct FavoritosView: View {
    @Binding var usuario: Usuario
    @StateObject private var viewModel = FavoritosViewModel()
    @State private var desfavoritando: Set<Int64> = []

    var body: some View {
        List {
            ForEach(viewModel.favoritos, id: \.idPokemon) { favorito in
                HStack {
                    AsyncImage(url: URL(string: favorito.imagemURL ?? "")) { image in
                        image.resizable().frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(favorito.nome ?? "")
                        .font(.headline)

                    Spacer()

                    Button(action: {
                        withAnimation(.spring()) {
                            desfavoritando.insert(favorito.idPokemon)
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            FavoritoService.shared.removerPokemonFavorito(
                                idPokemon: Int(favorito.idPokemon),
                                usuario: usuario
                            )
                            viewModel.carregarFavoritos(usuario: usuario)
                            desfavoritando.remove(favorito.idPokemon)
                        }
                    }) {
                        Image(systemName: desfavoritando.contains(favorito.idPokemon) ? "star" : "star.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.yellow)
                            .scaleEffect(desfavoritando.contains(favorito.idPokemon) ? 0.7 : 1.2)
                            .animation(.spring(), value: desfavoritando.contains(favorito.idPokemon))
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Favoritos")
        .onAppear {
            viewModel.carregarFavoritos(usuario: usuario)
        }
    }
}
