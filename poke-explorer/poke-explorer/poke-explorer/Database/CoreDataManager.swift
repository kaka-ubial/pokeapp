import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "PokeExplorerApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Erro ao carregar Core Data: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
