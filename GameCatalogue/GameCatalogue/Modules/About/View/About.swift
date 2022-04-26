//
//  About.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI

struct About: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer(minLength: 80)
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    Spacer(minLength: 30)
                    Text("Rizal Fahlepi")
                        .bold()
                        .font(.system(size: 25))
                    Spacer(minLength: 10)
                    Text("fahlepyrizal@gmail.com")
                        .bold()
                        .font(.system(size: 20))
                    
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            .navigationBarTitle(
                Text("Game Catalogue"),
                displayMode: .automatic
            )
        }
    }
}
