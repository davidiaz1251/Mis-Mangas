//
//  PathAPI.swift
//  Mis Mangas
//
//  Created by Alex Guerrero on 25/1/25.
//

import Foundation

enum APIListEndpoint {
    case mangas
    case bestMangas
    case authors
    case demographics
    case genres
    case themes
    case mangaByGenre(String)
    case mangaByDemographic(String)
    case mangaByTheme(String)
    case mangaByAuthor(String)
    
    var path: String {
        switch self {
        case .mangas:
            return "mangas"
        case .bestMangas:
            return "bestMangas"
        case .authors:
            return "authors"
        case .demographics:
            return "demographics"
        case .genres:
            return "genres"
        case .themes:
            return "themes"
        case .mangaByGenre(let genre):
            return "mangaByGenre/\(genre)"
        case .mangaByDemographic(let demographic):
            return "mangaByDemographic/\(demographic)"
        case .mangaByTheme(let theme):
            return "mangaByTheme/\(theme)"
        case .mangaByAuthor(let authorID):
            return "mangaByAuthor/\(authorID)"
        }
    }
}
