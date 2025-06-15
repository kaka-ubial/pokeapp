//
//  AuthService.swift
//  poke-explorer
//
//  Created by user276492 on 6/13/25.
//


import Foundation
import CoreData

class AuthService {
    static let shared = AuthService()
    
    func cadastrar(nome: String, email: String, senha: String) -> Usuario? {
        let context = CoreDataManager.shared.context
        
        let usuario = Usuario(context: context)
        usuario.id = UUID()
        usuario.nomeDeUsuario = nome
        usuario.email = email
        usuario.senha = senha
        
        CoreDataManager.shared.saveContext()
        return usuario
    }
    
    func autenticar(email: String, senha: String) -> Usuario? {
        let context = CoreDataManager.shared.context
        
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@ AND senha == %@", email, senha)
        
        return (try? context.fetch(request))?.first
    }
}
