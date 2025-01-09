//
//  ContentView.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = MangasVM()
    var body: some View {
        NavigationStack{
            List(vm.mangas){ manga in
                VStack{
                    Text(manga.title)
                    Text("\(manga.url!)")
                    Text("\(manga.startDate)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
