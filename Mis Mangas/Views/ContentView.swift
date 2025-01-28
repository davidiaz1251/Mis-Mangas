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
                Section{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 16){
                            ForEach(0..<10) { index in
                                ImageView(url: URL(string: "https://cdn.myanimelist.net/images/manga/3/161939l.jpg"))
                                    .scaledToFit()
                                    .frame(width: 180)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay {
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        VStack {
                                            Spacer()
                                            Text("Petshop of Horror")
                                                .font(.headline)
                                            Text("Capitulo 30 / 300")
                                                .font(.callout)
                                                .padding(.bottom)
                                        }
                                        .foregroundStyle(.white)
                                    }
                                    .scrollTargetLayout()
                            }
                        }
                    }
                    .scrollTargetBehavior(.viewAligned)
                } header:{
                    Text("Tus Mangas")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                
                Section{
                    ForEach(vm.mangas){manga in
                        NavigationLink(value: manga) {
                            HStack{
                                ImageView(url: manga.mainPicture)
                                    .scaledToFit()
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
                .padding(.top)
            }
            .padding()
            .navigationTitle("Best Mangas")
            .navigationDestination(for: Manga.self) { manga in
                DetailMangaView(manga: manga)
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
