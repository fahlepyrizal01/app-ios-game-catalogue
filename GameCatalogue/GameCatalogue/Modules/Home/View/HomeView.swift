//
//  HomeView.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    let layout = [GridItem(.adaptive(minimum: 130))]
    
    var body: some View {
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
