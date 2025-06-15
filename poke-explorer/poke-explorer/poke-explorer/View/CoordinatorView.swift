import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()
    @State private var usuarioLogado: Usuario? = nil

    var body: some View {
        switch coordinator.route {
        case .login:
            LoginView(usuarioLogado: $usuarioLogado)
                .environmentObject(coordinator)

        case .cadastro:
            CadastroView()
                .environmentObject(coordinator)

        case .tabBar(let usuario):
            TabBarView(usuarioLogado: .constant(Optional(usuario)))
                .environmentObject(coordinator)

        case .detalhes(let nome, let usuario):
            DetalhesPokemonView(nome: nome, usuario: .constant(usuario))
                .environmentObject(coordinator)
        }
    }
}
