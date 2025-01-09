//
//  NetworkError.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case general(Error)
    case status(Int)
    case json(Error)
    case dataNotValid
    case nonHTTP
    
    var errorDescription: String?{
        switch self {
        case .general(let error):
            return "Error general: \(error.localizedDescription)."
        case .status(let status):
            return "Error de status: \(status)"
        case .json(let error):
            return "Erro JSON: \(error)"
        case .dataNotValid:
            return "Error, dato no valido"
        case .nonHTTP:
            return "No es una conexion HTTP"
        }
    }
}
