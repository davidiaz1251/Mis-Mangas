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
    static func getListMangas(endPoint: APIListEndpoint, page: String = "1", per: String = "10") -> URL{
        api.appending(path: "list").appending(path: endPoint.path).appending(queryItems:
                                                                                [.querys("page", page),
                                                                                 .querys("per", per)])
    }
}

extension URLQueryItem{
    static func querys(_ name: String,_ query: String) -> URLQueryItem{
        URLQueryItem(name: name, value: query)
    }
}


