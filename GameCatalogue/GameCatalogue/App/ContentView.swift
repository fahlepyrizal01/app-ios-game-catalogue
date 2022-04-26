//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 24/04/22.
//

import SwiftUI
import Core
import FeatureHome
import FeatureDetail
import FeatureFavorite
import FeatureAbout

struct ContentView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    @EnvironmentObject var detailPresenter: DetailPresenter
    
    var body: some View {
        TabView {
            HomeView(homePresenter: homePresenter, action: { shortScreenshots, id in
                DetailView(detailPresenter: detailPresenter, shortScreenshots: shortScreenshots, id: id)
            })
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            FavoriteView(favoritePresenter: favoritePresenter, action: { shortScreenshots, id in
                DetailView(detailPresenter: detailPresenter, shortScreenshots: shortScreenshots, id: id)
            })
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
