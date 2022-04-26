//
//  FavoritePresenter.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import RxSwift
import ApiGames

class FavoritePresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let router = FavoriteRouter()
    private let gameUseCase: GameUseCase
    
    @Published var games: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(gameUseCase: GameUseCase) {
        self.gameUseCase = gameUseCase
    }
    
    func getGames() {
        loadingState = true
        gameUseCase.getGames(isFromLocal: true)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.games = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: game.shortScreenshots, id: game.id)
        ) { content() }
    }
    
}
