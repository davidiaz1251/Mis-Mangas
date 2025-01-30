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
    @State private var tab: Tabs = .resumen
    var body: some View {
        VStack(spacing: 0){
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
                            Spacer()
                            Text("Boys Love")
                                .padding(5)
                                .border(.white, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                        .frame(maxHeight: 160)
                        .foregroundStyle(.white)
                        .bold()
                    }
                    Text(manga.title)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding(.horizontal)
                .padding(.top, safeAreaTop)
            }
            
            Picker("Tabs", selection: $tab) {
                ForEach(Tabs.allCases, id: \.self) { tab in
                    Text(tab.rawValue).tag(tab)
                }
            }
            .pickerStyle(.segmented)
            
            switch tab{
            case .resumen:
                SummaryView()
            case .personajes:
                Text("personajes")
            case .otro:
                Text("otro")
            }
            Spacer()
        }
        .ignoresSafeArea()
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
        }
    }
}

extension DetailMangaView{
    private var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 0
    }
}

enum Tabs: String, CaseIterable {
    case resumen = "Resumen"
    case personajes = "Personajes"
    case otro = "Otro"
}


#Preview {
    NavigationStack{
        DetailMangaView(manga: NetworkTest.preview)
    }
}
