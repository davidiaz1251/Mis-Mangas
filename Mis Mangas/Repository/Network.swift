//
//  Network.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import Foundation

protocol DataRepository: Sendable{
    func getMangas() async throws -> [Manga]
    func getMangaAutor(id: String) async throws -> Manga?
    func getGenres() async throws -> [GenreModel]
    func getMangasByGenre(genre: GenreModel) async throws -> [Manga]
    func getBestMangas() async throws -> [Manga]
}

struct Network: DataRepository, NetworkInteractor{
    func getMangas() async throws -> [Manga]{
        return try await getJson(request: .get(.getListMangas(endPoint: .mangas)), type: Response.self).items.compactMap{ $0.toManga }
    }
    
    func getMangaAutor(id: String) async throws -> Manga?{
        try await getJson(request: .get(.getListMangas(endPoint: .mangaByAuthor(id))), type: MisMangaDTO.self).toManga
    }
    
    func getGenres() async throws -> [GenreModel] {
        try await getJson(request: .get(.getListMangas(endPoint: .genres)), type: [GenreModel].self)
    }
    
    func getMangasByGenre(genre: GenreModel) async throws -> [Manga]{
        try await getJson(request: .get(.getListMangas(endPoint: .mangaByGenre(genre.rawValue))), type: Response.self).items.compactMap{ $0.toManga }
    }
    
    func getBestMangas() async throws -> [Manga]{
        try await getJson(request: .get(.getListMangas(endPoint: .bestMangas)), type: Response.self).items.compactMap{ $0.toManga }
    }
}
