//
//  DetailPresenter.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import RxSwift
import ApiGames

class DetailPresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let gameUseCase: GameUseCase
    
    @Published var game: GameModel = GameModel()
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var favoriteIcon = "star"
    
    init(gameUseCase: GameUseCase) {
        self.gameUseCase = gameUseCase
    }
    
    func getGameDetail(id: Int) {
        loadingState = true
        gameUseCase.getGame(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.game = result
                if result.isFavorite {
                    self.favoriteIcon = "star.fill"
                } else {
                    self.favoriteIcon = "star"
                }
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func addFavorite(game: GameModel, shortScreenshots: [CommonModel]) {
        loadingState = true
        var gameModel = game
        gameModel.isFavorite = true
        gameModel.shortScreenshots = shortScreenshots
        gameUseCase.addGame(game: gameModel)
            .observe(on: MainScheduler.instance)
            .subscribe { _ in
                self.favoriteIcon = "star.fill"
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func removeFavorite(id: Int) {
        loadingState = true
        gameUseCase.removeGame(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe { _ in
                self.favoriteIcon = "star"
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
}
