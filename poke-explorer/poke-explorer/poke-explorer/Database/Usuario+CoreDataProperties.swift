//
//  func.swift
//  poke-explorer
//
//  Created by user276492 on 6/12/25.
//


// Usuario+CoreDataProperties.swift
import Foundation
import CoreData

extension Usuario {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var nomeDeUsuario: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?
}

extension Usuario: Identifiable { }
