import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    @Binding var usuarioLogado: Usuario?

    var body: some View {
        VStack(spacing: 20) {
            Text("PokéExplorer").font(.largeTitle.bold())
            
            TextField("Email", text: $viewModel.email).textFieldStyle(.roundedBorder)
            SecureField("Senha", text: $viewModel.senha).textFieldStyle(.roundedBorder)
            
            if let erro = viewModel.erro {
                Text(erro).foregroundColor(.red)
            }
            
            Button("Entrar") {
                viewModel.login()
            }
            .buttonStyle(.borderedProminent)

            Button("Não tem conta? Cadastre-se") {
                coordinator.next(route: .cadastro)
            }
        }
        .padding()
        .onChange(of: viewModel.usuarioLogado) { novoUsuario in
            if let usuario = novoUsuario {
                coordinator.next(route: .tabBar(usuario: usuario))
            }
        }
    }
}
