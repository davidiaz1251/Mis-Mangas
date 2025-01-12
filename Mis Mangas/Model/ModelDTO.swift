//
//  ModelDTO.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 21/12/24.
//

import Foundation

struct Response: Codable{
    let items: [MisMangaDTO]
    let metadata: MetaData
}

struct MetaData: Codable{
    let page: Int
    let per: Int
    let total: Int
}

struct MisMangaDTO: Codable {
    struct Theme: Codable {
        let id: String
        let theme: String
    }
    
    struct Author: Codable {
        let firstName: String
        let lastName: String
        let role: String
        let id: String
    }
    
    struct Genre: Codable {
        let id: String
        let genre: String
    }
    
    struct Demographic: Codable {
        let id: String
        let demographic: String
    }
    
    let id: Int
    let title: String
    let titleEnglish: String?
    let titleJapanese: String
    let url: String
    let startDate: Date
    let endDate: Date?
    let chapters: Int?
    let volumes: Int?
    let score: Double
    let status: String
    let mainPicture: String
    let sypnosis: String
    let background: String?
    let themes: [Theme]
    let authors: [Author]
    let genres: [Genre]
    let demographics: [Demographic]
}

extension MisMangaDTO {
    var toManga: Manga? {
        let mappedThemes = themes.compactMap { ThemeModel(rawValue: $0.theme) }
        let mappedAuthors = authors.map { AuthorModel(lastName: $0.lastName, firstName: $0.firstName, id: UUID(uuidString: $0.id)!, role: $0.role) }
        let mappedGenres = genres.compactMap { GenreModel(rawValue: $0.genre) }
        let mappedDemographics = demographics.compactMap { DemographicModel(rawValue: $0.demographic) }
        guard !mappedThemes.isEmpty,
              !mappedAuthors.isEmpty,
              !mappedGenres.isEmpty,
              !mappedDemographics.isEmpty
        else { return nil }
        
        return Manga(
            id: id,
            title: title,
            titleEnglish: titleEnglish,
            titleJapanese: titleJapanese,
            url: URL(string: url.replacingOccurrences(of: "^\"(.*)\"$", with: "$1", options: .regularExpression)),
            startDate: startDate,
            endDate: endDate,
            chapters: chapters,
            volumes: volumes,
            score: score,
            status: status,
            mainPicture: URL(string: mainPicture.replacingOccurrences(of: "^\"(.*)\"$", with: "$1", options: .regularExpression)),
            sypnosis: sypnosis,
            background: background,
            themes: mappedThemes,
            authors: mappedAuthors,
            genres: mappedGenres,
            demographics: mappedDemographics
        )
    }
}
