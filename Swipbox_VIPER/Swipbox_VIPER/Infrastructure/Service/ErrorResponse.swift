//
//  ErrorResponse.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import Foundation

enum ErrorResponse: Error {
    case noInternetConnection
    case apiKey
    case apiError(String?)
    case invalidEndpoint
    case invalidResponse
    case invalidStatusCode
    case decodingFailed
    case noData
    case serializationError(Error)
    
    public var description: String {
        switch self {
        case .noInternetConnection:
            return "No internet connection."
        case .apiKey:
            return "Invalid API key: You must be granted a valid key."
        case .apiError(let message):
            return message ?? "An unknown error occurred with the API."
        case .invalidEndpoint:
            return "The endpoint you are trying to reach is invalid."
        case .invalidResponse:
            return "Received an invalid response from the server."
        case .invalidStatusCode:
            return "Received an invalid status code from the server."
        case .noData:
            return "No data received from the server."
        case .decodingFailed:
            return "Failed to decode the data: \(String(describing: DecodingError.self))"
        case .serializationError(let error):
            return "Failed to serialize the data: \(error.localizedDescription)"
        }
    }
}
