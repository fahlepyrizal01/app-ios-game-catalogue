//
//  DetailView.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI
import SDWebImageSwiftUI
import ApiGames

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    
    let shortScreenshots: [CommonModel]
    let id: Int
    
    @Environment(\.presentationMode) var presentation
    
    private func concateValuePlatformModel(data: [PlatformModel]) -> String {
        var concateString = ""
        for(index, element) in data.enumerated() {
            if !(element.platform.name.isEmpty) {
                if index + 1 != data.count {
                    concateString += "\(element.platform.name), "
                } else {
                    concateString += element.platform.name
                }
            }
        }
        
        if concateString.isEmpty {
            concateString = "-"
        }
        
        return concateString
    }
    
    private func concateValueStoreModel(data: [StoreModel]) -> String {
        var concateString = ""
        
        for(index, element) in data.enumerated() {
            if !(element.store.name.isEmpty) {
                if index + 1 != data.count {
                    concateString += "\(element.store.name), "
                } else {
                    concateString += element.store.name
                }
            }
        }
        
        if concateString.isEmpty {
            concateString = "-"
        }
        
        return concateString
    }
    
    private func concateValueCommonModel(data: [CommonModel]) -> String {
        var concateString = ""
        
        for(index, element) in data.enumerated() {
            if !(element.name.isEmpty) {
                if index + 1 != data.count {
                    concateString += "\(element.name), "
                } else {
                    concateString += element.name
                }
            }
        }
        
        if concateString.isEmpty {
            concateString = "-"
        }
        
        return concateString
    }
    
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ActivityIndicator()
                }
            } else {
                ScrollView {
                    VStack {
                        imageGame
                        Spacer(minLength: 20)
                        name
                        Spacer(minLength: 20)
                        imageScreenshots
                        Spacer(minLength: 20)
                        contentFirst
                        Spacer(minLength: 20)
                    }
                    contentSecond
                    contentThird
                    contentfourth
                }
            }
        }
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentation.wrappedValue.dismiss() }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .imageScale(.large)
        }), trailing: Button(action: {
            if presenter.favoriteIcon == "star" {
                presenter.addFavorite(game: presenter.game, shortScreenshots: shortScreenshots)
            } else {
                presenter.removeFavorite(id: presenter.game.id)
            }
        }, label: {
            Image(systemName: presenter.favoriteIcon)
                .foregroundColor(.yellow)
                .imageScale(.large)
        }))
        .onAppear(perform: {
            self.presenter.getGameDetail(id: id)
        })
    }
}

extension DetailView {
    
    var imageGame: some View {
        WebImage(url: URL(string: presenter.game.backgroundImage))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .aspectRatio(contentMode: .fill)
    }
    
    var imageScreenshots: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(shortScreenshots, id: \.id) { result in
                    WebImage(url: URL(string: result.image))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .clipped()
                        .frame(width: 170, height: 100)
                }
            }
        }
    }
    
    var name: some View {
        Text(presenter.game.name)
            .font(.system(size: 25))
            .bold()
    }
    
    var contentFirst: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Slug : ")
                    .font(.system(size: 16))
                    .bold()
                Text(presenter.game.slug)
                    .font(.system(size: 16))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Release Date : ")
                    .font(.system(size: 16))
                    .bold()
                Text(DateUtils.generateDate(date: presenter.game.released))
                    .font(.system(size: 16))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
    }
    
    var contentSecond: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Metacritic : ")
                    .font(.system(size: 16))
                    .bold()
                Text(String(presenter.game.metacritic))
                    .font(.system(size: 16))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.small)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Rating : ")
                    .font(.system(size: 16))
                    .bold()
                Text(String(format: "%.1f", presenter.game.rating))
                    .font(.system(size: 16))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.small)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Rating Top : ")
                    .font(.system(size: 16))
                    .bold()
                Text(String(presenter.game.ratingTop))
                    .font(.system(size: 16))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.small)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Rating Count : ")
                    .font(.system(size: 16))
                    .bold()
                Text(String(presenter.game.ratingsCount))
                    .font(.system(size: 16))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Website : ")
                    .font(.system(size: 16))
                    .bold()
                Text(presenter.game.website)
                    .font(.system(size: 16))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
        }
    }
    
    var contentThird: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Genres : ")
                    .font(.system(size: 16))
                    .bold()
                Text(concateValueCommonModel(data: presenter.game.genres))
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Publisher : ")
                    .font(.system(size: 16))
                    .bold()
                Text(concateValueCommonModel(data: presenter.game.publishers))
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Developers : ")
                    .font(.system(size: 16))
                    .bold()
                Text(concateValueCommonModel(data: presenter.game.developers))
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Stores : ")
                    .font(.system(size: 16))
                    .bold()
                Text(concateValueStoreModel(data: presenter.game.stores))
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("Platforms : ")
                    .font(.system(size: 16))
                    .bold()
                Text(concateValuePlatformModel(data: presenter.game.platforms))
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer(minLength: 20)
        }
    }
    
    var contentfourth: some View {
        VStack {
            Text("Description : ")
                .font(.system(size: 16))
                .bold()
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: 10)
            Text(presenter.game.descriptionRaw)
                .font(.system(size: 16))
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
        }
    }
    
}
