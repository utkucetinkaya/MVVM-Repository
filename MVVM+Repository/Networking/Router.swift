//
//  Router.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case getPokemonList

    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }

    var method: HTTPMethod {
        switch self {
        case .getPokemonList:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getPokemonList:
            return "/pokemon"
        }
    }

    var headers: HTTPHeaders {
        return [:]
    }

    var parameters: Parameters? {
        switch self {
        case .getPokemonList:
            return ["limit": 40]
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers

        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
