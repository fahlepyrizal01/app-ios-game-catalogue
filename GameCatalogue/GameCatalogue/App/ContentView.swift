//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 24/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    
    var body: some View {
        TabView {
            HomeView(presenter: homePresenter)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            FavoriteView(presenter: favoritePresenter)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            
            About()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("About")
                }
        }
    }
    
}
