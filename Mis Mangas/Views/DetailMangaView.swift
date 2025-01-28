//
//  DetailMangaView.swift
//  Mis Mangas
//
//  Created by Alex Guerrero on 26/1/25.
//

import SwiftUI

struct DetailMangaView: View {
    @State var manga: Manga
    @State private var favorite = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            ZStack{
                ImageView(url: manga.mainPicture)
                    .scaledToFill()
                    .frame(height: 360)
                    .blur(radius: 10)
                    .overlay {
                        Color.black.opacity(0.3)
                    }
                    .clipped()
                VStack(alignment: .leading){
                    HStack(spacing: 16){
                        ImageView(url: manga.mainPicture)
                            .scaledToFit()
                            .frame(height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading){
                            Text(manga.sypnosis)
                                .lineLimit(6)
                            Text("Boys Love")
                                .padding(5)
                                .border(.white, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                        .foregroundStyle(.white)
                        .bold()
                    }
                    Text(manga.title)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding(.horizontal)
                .padding(.top,60)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button{
                        favorite.toggle()
                    }label:{
                        Image(systemName: "heart")
                            .foregroundStyle(.white)
                            .symbolVariant(favorite ? .fill : .none)
                            .padding(.trailing)
                    }
                    
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button{
                        dismiss()
                    }label:{
                        HStack{
                            Image(systemName: "arrow.left.circle")
                            Text("Best Mangas")
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            Text("des")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.white
                }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    NavigationStack{
        DetailMangaView(manga: NetworkTest.preview)
    }
}
