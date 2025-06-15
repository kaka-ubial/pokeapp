//
//  CadastroViewModel 2.swift
//  poke-explorer
//
//  Created by user276492 on 6/14/25.
//


import Foundation
import Combine

class CadastroViewModel: ObservableObject {
    @Published var nome = ""
    @Published var email = ""
    @Published var senha = ""
    @Published var erro: String?
    @Published var sucesso = false
    
    func cadastrar() {
        erro = nil
        
        guard !nome.isEmpty, !email.isEmpty, !senha.isEmpty else {
            erro = "Preencha todos os campos"
            return
        }
        
        guard isValidEmail(email) else {
            erro = "Email inválido"
            return
        }
        
        guard senha.count >= 8 else {
            erro = "A senha deve ter pelo menos 8 caracteres"
            return
        }
        
        if AuthService.shared.autenticar(email: email, senha: senha) != nil {
            erro = "Email já cadastrado"
            return
        }
        
        if AuthService.shared.cadastrar(nome: nome, email: email, senha: senha) != nil {
            sucesso = true
        } else {
            erro = "Erro ao cadastrar usuário"
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Regex simples para validar email
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}
