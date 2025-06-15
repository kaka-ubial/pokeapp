
// Favorito+CoreDataProperties.swift
import Foundation
import CoreData

extension Favorito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorito> {
        return NSFetchRequest<Favorito>(entityName: "Favorito")
    }

    @NSManaged public var idPokemon: Int64
    @NSManaged public var nome: String?
    @NSManaged public var imagemURL: String?
    @NSManaged public var dono: Usuario?
}

extension Favorito: Identifiable {
}
