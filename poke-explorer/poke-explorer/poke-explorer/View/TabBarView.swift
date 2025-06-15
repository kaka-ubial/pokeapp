import SwiftUI

struct TabBarView: View {
    @Binding var usuarioLogado: Usuario?

    var body: some View {
        if let usuario = usuarioLogado {
            let bindingUsuario = Binding<Usuario>(
                get: { usuario },
                set: { usuarioLogado = $0 }
            )

            TabView {
                ListaPokemonView(usuario: bindingUsuario)
                    .tabItem {
                        Label("Pokémons", systemImage: "list.bullet")
                    }

                FavoritosView(usuario: bindingUsuario)
                    .tabItem {
                        Label("Favoritos", systemImage: "star.fill")
                    }
            }
        } else {
            Text("Erro: Usuário não logado")
        }
    }
}

