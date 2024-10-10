//
//  NetworkService.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import Foundation


protocol NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}


final class DefaultNetworkService: NetworkService {
    
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = createError(domain: ErrorResponse.invalidEndpoint, code: 404)
            return completion(.failure(error))
        }
        
        var queryItems: [URLQueryItem] = []
        request.queryItems?.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            queryItems.append(urlQueryItem)
        }
        
        // Assign query items to the URL components
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            let error = createError(domain: ErrorResponse.invalidEndpoint, code: 404)
            return completion(.failure(error))
        }
        
        // Configure the URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        // Perform the network request
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            // Validate the HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = self.createError(domain: ErrorResponse.invalidResponse, code: 500)
                return completion(.failure(error))
            }
            
            // Check for HTTP status code
            guard 200..<300 ~= httpResponse.statusCode else {
                let error = self.createError(domain: ErrorResponse.invalidStatusCode, code: httpResponse.statusCode)
                return completion(.failure(error))
            }
            
            // Ensure we have data
            guard let data = data else {
                let error = self.createError(domain: ErrorResponse.noData, code: 204)
                return completion(.failure(error))
            }
            
            // Try decoding the data
            do {
                let decodedData = try request.decode(data)
                completion(.success(decodedData))
            } catch let decodingError as NSError {
                completion(.failure(self.createError(domain: ErrorResponse.decodingFailed, code: decodingError.code, userInfo: [NSLocalizedDescriptionKey: decodingError.localizedDescription])))
            }
            
        }.resume()
    }
    
    // A helper function to create NSError objects
    func createError(domain: ErrorResponse, code: Int, userInfo: [String: Any]? = nil) -> NSError {
        return NSError(domain: domain.description, code: code, userInfo: userInfo)
    }
}
