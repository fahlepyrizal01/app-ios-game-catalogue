//
//  FavoriteView.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePresenter
    
    let layout = [GridItem(.adaptive(minimum: 130))]
    
    var body: some View {
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
                                self.presenter.linkBuilder(for: game) {
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
