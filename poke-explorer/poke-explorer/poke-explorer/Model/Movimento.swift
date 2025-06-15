//
//  Movimento.swift
//  poke-explorer
//
//  Created by user276492 on 6/12/25.
//


struct Movimento: Decodable {
    let move: NomeMovimento
}

struct NomeMovimento: Decodable {
    let name: String
}
