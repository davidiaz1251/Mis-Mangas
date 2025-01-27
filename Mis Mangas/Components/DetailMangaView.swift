//
//  DetailMangaView.swift
//  Mis Mangas
//
//  Created by Alex Guerrero on 26/1/25.
//

import SwiftUI

struct DetailMangaView: View {
    @State var manga: Manga
    var body: some View {
        Text(manga.title)
    }
}

#Preview {
    DetailMangaView(manga: NetworkTest.preview)
}
