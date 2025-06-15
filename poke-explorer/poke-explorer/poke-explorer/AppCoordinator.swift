//
//  AppCoordinator.swift
//  poke-explorer
//
//  Created by user276492 on 6/13/25.
//


import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var route: AppRoute = .login
    
    func next(route: AppRoute) {
        self.route = route
    }

}
