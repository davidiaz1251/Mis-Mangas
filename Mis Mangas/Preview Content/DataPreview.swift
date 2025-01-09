//
//  DataPreview.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 8/1/25.
//

import Foundation


struct NetworkTest: DataRepository{
    func getMangas() async throws -> [Manga] {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: [MisMangaDTO].self).compactMap{ $0.toManga }
    }
    func getManga(id: Int) async throws -> Manga? {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: [MisMangaDTO].self).compactMap{ $0.toManga }.first
    }
    func getJson<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Decodable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }

}
