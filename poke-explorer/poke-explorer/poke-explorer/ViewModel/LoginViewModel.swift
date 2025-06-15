import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var senha = ""
    @Published var erro: String?
    @Published var usuarioLogado: Usuario?
    
    func login() {
        guard !email.isEmpty, !senha.isEmpty else {
            erro = "Preencha todos os campos"
            return
        }
        
        if let usuario = AuthService.shared.autenticar(email: email, senha: senha) {
            usuarioLogado = usuario
        } else {
            erro = "Usuário ou senha inválidos"
        }
    }
}
