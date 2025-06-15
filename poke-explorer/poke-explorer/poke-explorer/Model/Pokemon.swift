import Foundation

struct Pokemon: Identifiable, Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeElement]
    let abilities: [AbilitySlot]
    let moves: [MoveSlot]
    let sprites: Sprites
    
    var imageURL: URL? {
        URL(string: sprites.front_default)
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: NamedAPIResource
}

struct AbilitySlot: Codable {
    let ability: NamedAPIResource
}

struct MoveSlot: Codable {
    let move: NamedAPIResource
}

struct Sprites: Codable {
    let front_default: String
}

struct NamedAPIResource: Codable {
    let name: String
    let url: String
}
