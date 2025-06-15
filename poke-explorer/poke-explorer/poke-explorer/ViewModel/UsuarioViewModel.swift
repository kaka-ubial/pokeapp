import Foundation
import CoreData
import Combine

class UsuarioViewModel: ObservableObject {
    @Published var usuarioAtual: Usuario? = nil

    private let context = CoreDataManager.shared.context

    func login(email: String, senha: String) -> Bool {
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        request.predicate = NSPredicate(
            format: "email ==[c] %@ AND senha == %@",
            email.trimmingCharacters(in: .whitespacesAndNewlines),
            senha
        )

        do {
            let result = try context.fetch(request)
            if let user = result.first {
                usuarioAtual = user
                return true
            }
        } catch {
            print("Erro ao buscar usuário: \(error)")
        }
        return false
    }

    func cadastrarTeste() -> String? {
        let novoUsuario = Usuario(context: context)
        novoUsuario.id = UUID()
        novoUsuario.nomeDeUsuario = "Teste"
        novoUsuario.email = "teste@example.com"
        novoUsuario.senha = "123456"

        do {
            try context.save()
            usuarioAtual = novoUsuario
            return nil
        } catch let error as NSError {
            print("Erro ao cadastrar usuário teste: \(error), \(error.userInfo)")
            return "Erro inesperado ao cadastrar usuário: \(error.localizedDescription)"
        }
    }
    
    func cadastrar(nome: String, email: String, senha: String) -> String? {
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        request.predicate = NSPredicate(format: "email ==[c] %@", email.trimmingCharacters(in: .whitespacesAndNewlines))

        do {
            let existentes = try context.fetch(request)
            guard existentes.isEmpty else {
                return "Email já cadastrado"
            }

            let novoUsuario = Usuario(context: context)
            novoUsuario.id = UUID()
            novoUsuario.nomeDeUsuario = nome
            novoUsuario.email = email
            novoUsuario.senha = senha
            print("Contexto: \(context)")
            try context.save()
            usuarioAtual = novoUsuario
            return nil // Sucesso

        } catch {
            print("Erro ao cadastrar usuário: \(error)")
            return "Erro inesperado ao cadastrar usuário"
        }
    }

    func logout() {
        usuarioAtual = nil
    }
}
