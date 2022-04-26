//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import RxSwift
import ApiGames

public class HomePresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let gameUseCase: GameUseCase
    
    @Published var games: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    public init(gameUseCase: GameUseCase) {
        self.gameUseCase = gameUseCase
    }
    
    func getGames() {
        loadingState = true
        gameUseCase.getGames(isFromLocal: false)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.games = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
}
