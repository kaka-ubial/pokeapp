//
//  PokemonListResponse.swift
//  poke-explorer
//
//  Created by user276492 on 6/13/25.
//


import Foundation

struct PokemonListResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [NamedAPIResource]
}
