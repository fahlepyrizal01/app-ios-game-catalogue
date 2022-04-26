//
//  HomeRouter.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import ApiGames

class HomeRouter {
    
    func makeDetailView(for shortScreenshots: [CommonModel], id: Int) -> some View {
        let gameUseCase = Injection.init().provideGame()
        let presenter = DetailPresenter(gameUseCase: gameUseCase)
        return DetailView(presenter: presenter, shortScreenshots: shortScreenshots, id: id)
    }
    
}
