//
//  URL.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 3/1/25.
//

import Foundation

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com")!

/// # in case you need for different environments #
//#if DEBUG
//let api = URL(string: "http://localhost:8080")!
//#else
//let api = urlProd
//#endif

extension URL{
    static let getMangas = api.appending(path: "list/mangas")
    static func getMangasPage(page: String, per: String) -> URL{
        api.appending(path: "list/mangas").appending(queryItems:
                                                        [.querys("page", page),
                                                         .querys("per", per)])
    }
    static func getMangaById( id: Int) -> URL{
        api.appending(path: "list/mangas/\(id)")
    }
    static func getMangasByGenre(genre: String) -> URL{
        api.appending(path: "list/mangaByGenre").appending(path: genre)
    }
    static let getGenres = api.appending(path: "list/genres")
}

extension URLQueryItem{
    static func querys(_ name: String,_ query: String) -> URLQueryItem{
        URLQueryItem(name: name, value: query)
    }
}
