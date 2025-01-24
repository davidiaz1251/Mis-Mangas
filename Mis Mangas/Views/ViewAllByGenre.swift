//
//  ViewAllByGenre.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 19/1/25.
//

import SwiftUI

struct ViewAllByGenre: View {
    @Environment(MangasVM.self) private var vm: MangasVM
    let genre: GenreModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(vm.mangasGenre) { manga in
                        VStack{
                            ImageView(url: manga.mainPicture)
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text(manga.title)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Listado Genre \(genre.rawValue)")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await vm.getMangaByGenre(genre: genre)
        }
    }
}

#Preview {
    NavigationStack{
        ViewAllByGenre(genre: GenreModel.action)
            .environment(MangasVM(network: NetworkTest()))
    }
}
