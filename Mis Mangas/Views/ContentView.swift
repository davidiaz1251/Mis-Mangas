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
                ForEach(vm.mangas){manga in
                    NavigationLink(value: manga) {
                        HStack{
                            ImageView(url: manga.mainPicture)
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            VStack(alignment: .leading){
                                Text(manga.title)
                                Text(manga.titleJapanese)
                                HStack{
                                    Text("Capítulos: \(manga.chapters ?? 0)")
                                    Text("|")
                                    Text("Volúmenes: \(manga.volumes ?? 0)")
                                }
                                HStack{
                                    Text("Generos: ")
                                    ForEach(manga.genres.prefix(2)){genre in
                                        Text("\(genre.rawValue),")
                                            .font(.subheadline)
                                    }
                                }
                                Text("Score: \(manga.score.formatted(.number.precision(.fractionLength(0...2))))")
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            .navigationTitle("Best Mangas")
            .navigationDestination(for: Manga.self) { manga in
                Text(manga.title)
            }
        }
    }
}
/*.scrollTargetLayout()
 .scrollTargetBehavior(.viewAligned)*/
#Preview {
    ContentView()
        .environment(MangasVM(network: NetworkTest()))
}
