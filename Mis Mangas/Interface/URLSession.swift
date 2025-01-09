//
//  URLSession.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import Foundation

extension URLSession{
    func getData(from url: URL) async throws(NetworkError) -> (data: Data, response: HTTPURLResponse){
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else{
                throw NetworkError.nonHTTP
            }
            return (data, response)
        }catch let error as NetworkError{
            throw error
        }catch{
            throw .general(error)
        }
    }
    
    func getData(for request: URLRequest) async throws(NetworkError) -> (data: Data, response: HTTPURLResponse){
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else{
                throw NetworkError.nonHTTP
            }
            return (data, response)
        }catch let error as NetworkError{
            throw error
        }catch{
            throw .general(error)
        }
    }
}
