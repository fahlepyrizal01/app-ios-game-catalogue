//
//  GameCatalogueApp.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 24/04/22.
//

import SwiftUI
import ApiGames

@main
struct GameCatalogueApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomePresenter(gameUseCase: Injection.init().provideGame()))
                .environmentObject(FavoritePresenter(gameUseCase: Injection.init().provideGame()))
        }
    }
    
}
