//
//  AppRoute.swift
//  poke-explorer
//
//  Created by user276492 on 6/13/25.
//


import Foundation

enum AppRoute: Equatable {
    case login
    case cadastro
    case tabBar(usuario: Usuario)
    case detalhes(nome: String, usuario: Usuario)
}
