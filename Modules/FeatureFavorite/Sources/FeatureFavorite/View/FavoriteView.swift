//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import ApiGames
import Core

public struct FavoriteView<Destination: View>: View {
    
    @ObservedObject var presenter: FavoritePresenter
    let action: (([CommonModel], Int) -> Destination)
    
    public init(favoritePresenter: FavoritePresenter, action: @escaping (([CommonModel], Int) -> Destination)) {
        self.presenter = favoritePresenter
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
                } else if presenter.games.isEmpty {
                    VStack {
                        Image("empty")
                            .foregroundColor(.blue)
                            .imageScale(.large)
                        Text("No favorite game yet.")
                            .font(.system(size: 25))
                            .bold()
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
