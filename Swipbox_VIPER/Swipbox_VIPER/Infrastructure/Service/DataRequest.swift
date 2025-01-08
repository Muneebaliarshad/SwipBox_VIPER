//
//  DataRequest.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol DataRequest {
    associatedtype Response: Decodable
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [String: String]? { get }
    func decode(_ data: Data) throws -> Response
}


extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Response.self, from: data)
        } catch let error {
            print("Decoding error: \(error)")
            throw error
        }
    }
}

extension DataRequest {
    
    var headers: [String: String]? {
        return ["Accept": "application/json",
                "Authorization": "Bearer \(AppConfiguration.shared.apiAccessToken)"]
    }
    
    var queryItems: [String: String]? {
        return nil
    }
}
