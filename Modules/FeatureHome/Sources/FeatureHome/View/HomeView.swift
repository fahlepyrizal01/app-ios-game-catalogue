//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import Core
import ApiGames

public struct HomeView<Destination: View>: View {
    
    @ObservedObject var presenter: HomePresenter
    let action: (([CommonModel], Int) -> Destination)
    
    public init(homePresenter: HomePresenter, action: @escaping (([CommonModel], Int) -> Destination)) {
        self.presenter = homePresenter
        self.action = action
    }
    
    let layout = [GridItem(.adaptive(minimum: 130))]
    
    public var body: some View {
        NavigationView {
            ZStack {
                if presenter.loadingState {
                    VStack {
                        Text("Loading...")
                        ActivityIndicator()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout) {
                            ForEach(self.presenter.games, id: \.id) { game in
                                NavigationLink(destination: self.action(game.shortScreenshots, game.id)) {
                                    GameItem(game: game)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle(
                Text("Game Catalogue"),
                displayMode: .automatic
            )
            .onAppear {
                self.presenter.getGames()
            }
        }
    }
    
}
