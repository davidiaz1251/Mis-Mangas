//
//  ContentView.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = MangasVM()
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                ForEach(vm.mangas, id: \.genre.rawValue) { genre in
                    VStack(alignment: .leading) {
                        HStack{
                            Text(genre.genre.rawValue)
                                .font(.headline)
                            Spacer()
                            NavigationLink("Ver todos") {
                                Text("hola")
                            }
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                ForEach(genre.mangas) { manga in
                                    VStack{
                                        AsyncImage(url: manga.mainPicture){ image in
                                            image.resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 150)
                                                .clipShape(
                                                    RoundedRectangle(cornerRadius: 10)
                                                )
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Mangas")
            // .searchable(text: $vm.search, prompt: "Buscar Manga")
        }
    }
}

#Preview {
    ContentView(vm: MangasVM(network: NetworkTest()))
}
