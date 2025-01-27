//
//  DataPreview.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 8/1/25.
//

import Foundation


struct NetworkTest: DataRepository{
    func getBestMangas() async throws -> [Manga] {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: Response.self).items.compactMap{ $0.toManga }
    }
    
    func getMangas() async throws -> [Manga] {
        try getJson(url: Bundle.main.url(forResource: "mangasPreview", withExtension: "json")!, type: Response.self).items.compactMap{ $0.toManga }
    }
    func getMangaAutor(id: String) async throws -> Manga? {
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
extension NetworkTest{
    static var preview: Manga{
        Manga(
            id: 104,
            title: "Yotsuba to!",
            titleEnglish: "Yotsuba&!",
            titleJapanese: "よつばと!",
            url: URL(string: "https://myanimelist.net/manga/104/Yotsuba_to"),
            startDate: ISO8601DateFormatter().date(from: "2003-03-21T00:00:00Z")!,
            endDate: nil,
            chapters: nil,
            volumes: nil,
            score: 8.88,
            status: "currently_publishing",
            mainPicture: URL(string: "https://cdn.myanimelist.net/images/manga/5/259524l.jpg"),
            sypnosis: """
            While most people find the world mundane, five-year-old Yotsuba Koiwai sees it as a treasure trove ...
            """,
            background: """
            In 2006, Yotsuba to! received an Excellence Award in manga category at Japan Media Arts Festival ...
            """,
            themes: [
                .childcare,
                .iyashikei
            ],
            authors: [
                AuthorModel(
                    lastName: "Azuma",
                    firstName: "Kiyohiko",
                    id: UUID(uuidString: "1907E1C8-560E-4FEF-9F31-80E507848A9E")!,
                    role: "Story & Art"
                )
            ],
            genres: [
                .awardWinning,
                .comedy,
                .sliceOfLife
            ],
            demographics: []
        )
    }
}
