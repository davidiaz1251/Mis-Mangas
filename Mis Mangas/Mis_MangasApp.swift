//
//  Mis_MangasApp.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 7/12/24.
//

import SwiftUI

@main
struct Mis_MangasApp: App {
    @State var vm = MangasVM()
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .environment(vm)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Text("Search")
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                Text("Favorito")
                    .tabItem {
                        Label("Favorite", systemImage: "heart")
                    }
            }
        }
    }
}

