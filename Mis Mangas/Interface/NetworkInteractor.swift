//
//  NetworkInteractor.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import Foundation

protocol NetworkInteractor {}

extension NetworkInteractor{
    func  getJson<JSON>(request: URLRequest,
                        type: JSON.Type) async throws(NetworkError) -> JSON
    where JSON: Codable{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200{
            do {
                return try decoder.decode(JSON.self, from: data)
            } catch {
                throw .json(error)
            }
        }else{
            throw .status(response.statusCode)
        }
    }
    
    func getStatusCode(request: URLRequest, status: Int = 200) async throws(NetworkError){
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status{
            throw .status(response.statusCode)
        }
    }
}
