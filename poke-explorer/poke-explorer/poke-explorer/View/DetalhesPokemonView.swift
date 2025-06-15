import SwiftUI

struct DetalhesPokemonView: View {
    let nome: String
    @Binding var usuario: Usuario
    @StateObject private var viewModel = DetalhesPokemonViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var animarFavorito = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            if let poke = viewModel.pokemon {
                AsyncImage(url: URL(string: poke.sprites.front_default)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .transition(.scale)
                        .animation(.spring(), value: poke.sprites.front_default)
                } placeholder: {
                    ProgressView()
                }

                Text(poke.name.capitalized)
                    .font(.title.bold())

                Text("Tipo: \(poke.types.map { $0.type.name.capitalized }.joined(separator: ", "))")
                Text("Altura: \(poke.height) | Peso: \(poke.weight)")

                Button(action: {
                    withAnimation(.spring()) {
                        animarFavorito = true
                    }
                    viewModel.favoritar(usuario: usuario)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        animarFavorito = false
                        coordinator.next(route: .tabBar(usuario: usuario))
                    }
                }) {
                    Image(systemName: animarFavorito ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                        .scaleEffect(animarFavorito ? 1.3 : 1.0)
                }
            } else if let erro = viewModel.erro {
                Text(erro).foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
        .padding()
        .navigationTitle(nome.capitalized)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Voltar", systemImage: "chevron.left")
                }
            }
        }
        .onAppear {
            viewModel.carregarDetalhes(nome: nome)
        }
    }
}
