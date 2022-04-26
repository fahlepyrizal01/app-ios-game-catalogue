//
//  GameItem.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import SDWebImageSwiftUI
import ApiGames

struct GameItem: View {
    
    var game: GameModel
    
    var body: some View {
        VStack {
            imageGame
            content
        }
        .background(Color.white)
        .modifier(CardModifier())
        .padding(.all)
    }
}

extension GameItem {
    
    var imageGame: some View {
        WebImage(url: URL(string: game.backgroundImage))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .clipped()
            .frame(width: 170, height: 100)
    }
    
    var content: some View {
        VStack {
            Text(game.name )
                .bold()
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            HStack {
                Text(String(format: "%.1f", game.rating))
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.small)
            }
            .padding(.horizontal)
            Text(DateUtils.generateDate(date: game.released))
                .font(.system(size: 14))
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
}
