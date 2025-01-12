//
//  Network.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import Foundation

protocol DataRepository: Sendable{
    func getMangas() async throws -> [Manga]
    func getManga(id: Int) async throws -> Manga?
    func getGenres() async throws -> [GenreModel]
    func getMangasByGenre(genre: GenreModel) async throws -> [Manga]
}

struct Network: DataRepository, NetworkInteractor{
    func getMangas() async throws -> [Manga]{
        return try await getJson(request: .get(.getMangas), type: Response.self).items.compactMap{ $0.toManga }
    }
    
    func getManga(id: Int) async throws -> Manga?{
        try await getJson(request: .get(.getMangaById(id: id)), type: MisMangaDTO.self).toManga
    }
    
    func getGenres() async throws -> [GenreModel] {
        try await getJson(request: .get(.getGenres), type: [GenreModel].self)
    }
    
    func getMangasByGenre(genre: GenreModel) async throws -> [Manga]{
       try await getJson(request: .get(.getMangasByGenre(genre: genre.rawValue)), type: Response.self).items.compactMap{ $0.toManga }
    }
}
