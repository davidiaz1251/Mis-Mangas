//
//  ContentView.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(MangasVM.self) private var vm: MangasVM
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                ForEach(vm.mangas, id: \.genre.rawValue) { genre in
                    VStack(alignment: .leading) {
                        HStack{
                            Text(genre.genre.rawValue)
                                .font(.headline)
                            Spacer()
                            NavigationLink(value: genre.genre) {
                                Text("Ver más")
                            }
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                ForEach(genre.mangas) { manga in
                                    VStack{
                                        ImageView(url: manga.mainPicture)
                                            .frame(width: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Mangas")
            .navigationDestination(for: GenreModel.self) { genre in
                ViewAllByGenre(genre: genre)
            }
            // .searchable(text: $vm.search, prompt: "Buscar Manga")
        }
    }
}

#Preview {
    ContentView()
        .environment(MangasVM(network: NetworkTest()))
}
