//
//  DataPreview.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 8/1/25.
//

import Foundation


struct NetworkTest: DataRepository{
    func getMangas() async throws -> [Manga] {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: Response.self).items.compactMap{ $0.toManga }
    }
    func getManga(id: Int) async throws -> Manga? {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: Response.self).items.compactMap{ $0.toManga }.first
    }
    func getGenres() async throws -> [GenreModel] {
        try getJson(url: Bundle.main.url(forResource: "genrePreview", withExtension: "json")!, type: [GenreModel].self)
    }
    
    func getMangasByGenre(genre: GenreModel) async throws -> [Manga] {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: Response.self).items.compactMap{ $0.toManga }
    }
    
    
    func getJson<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Decodable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let data = try Data(contentsOf: url)
        return try decoder.decode(type, from: data)
    }

}
