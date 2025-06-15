//
//  Habilidade.swift
//  poke-explorer
//
//  Created by user276492 on 6/12/25.
//


struct Habilidade: Decodable {
    let ability: NomeHabilidade
}

struct NomeHabilidade: Decodable {
    let name: String
}
