//
//  poke_explorerApp.swift
//  poke-explorer
//
//  Created by user276492 on 6/6/25.
//

import SwiftUI

@main
struct PokeExplorerApp: App {
    let coreDataManager = CoreDataManager.shared
    @StateObject var usuarioVM = UsuarioViewModel()

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(usuarioVM)
                .environment(\.managedObjectContext, coreDataManager.context)
        }
    }
}
