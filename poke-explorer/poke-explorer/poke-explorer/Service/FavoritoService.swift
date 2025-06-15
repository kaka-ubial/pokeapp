import Foundation
import CoreData

class FavoritoService {
    static let shared = FavoritoService()

    func adicionarPokemonFavorito(pokemon: Pokemon, usuario: Usuario) {
        let context = CoreDataManager.shared.context

        let favorito = Favorito(context: context)
        favorito.idPokemon = Int64(pokemon.id)
        favorito.nome = pokemon.name
        favorito.imagemURL = pokemon.sprites.front_default
        favorito.dono = usuario

        CoreDataManager.shared.saveContext()
    }

    func removerPokemonFavorito(idPokemon: Int, usuario: Usuario) {
        let context = CoreDataManager.shared.context

        let request: NSFetchRequest<Favorito> = Favorito.fetchRequest()
        request.predicate = NSPredicate(format: "idPokemon == %d AND dono == %@", idPokemon, usuario)

        if let favorito = (try? context.fetch(request))?.first {
            context.delete(favorito)
            CoreDataManager.shared.saveContext()
        }
    }

    func buscarFavoritos(usuario: Usuario) -> [Favorito] {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<Favorito> = Favorito.fetchRequest()
        request.predicate = NSPredicate(format: "dono == %@", usuario)

        return (try? context.fetch(request)) ?? []
    }
}
