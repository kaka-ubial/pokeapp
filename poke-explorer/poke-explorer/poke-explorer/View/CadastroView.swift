import SwiftUI

struct CadastroView: View {
    @StateObject private var viewModel = CadastroViewModel()
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Crie sua conta")
                .font(.title2.bold())

            TextField("Nome", text: $viewModel.nome)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Senha", text: $viewModel.senha)
                .textFieldStyle(.roundedBorder)

            if let erro = viewModel.erro {
                Text(erro).foregroundColor(.red)
            }

            Button("Cadastrar") {
                viewModel.cadastrar()
            }
            .buttonStyle(.borderedProminent)

            Button("Voltar ao Login") {
                coordinator.next(route: .login)
            }
        }
        .padding()
        .onChange(of: viewModel.sucesso) { sucesso in
            if sucesso {
                coordinator.next(route: .login)
            }
        }
    }
}
