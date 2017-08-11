//
//  ApiClient.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//
//  Simple api client that supports json.
//

import Foundation

private enum HTTPMethod: String {
    case GET
    case POST
}

public class VSApiClient {
    public init() { }
    
    private func performRequest(request: URLRequest, _ completion: @escaping (VSApiResponseStatus) -> Void) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                completion(.Failure(error))
            } else if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                completion(.Success(response))
            } else {
                completion(.Failure(nil))
            }
        }).resume()
    }
}

extension VSApiClient: VSApiClientProtocol {
    public func get(_ url: String, queryParams: [URLQueryItem]?, completion: @escaping (VSApiResponseStatus) -> Void) {
        guard var urlComponents = URLComponents(string: url) else {
            assertionFailure("GET: invalid url")
            completion(.Failure(nil))
            return
        }
        
        urlComponents.queryItems = queryParams
        
        guard let url = urlComponents.url else {
            assertionFailure("GET: invalid url")
            completion(.Failure(nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        
        performRequest(request: request, completion)
    }
    
    //TODO: make POST support a request body -- json?
    public func post(_ url: String, _ completion: @escaping (VSApiResponseStatus) -> Void) {
        guard let urlComponents = URLComponents(string: url),
            let url = urlComponents.url else {
                assertionFailure("POST: invalid url")
                completion(.Failure(nil))
                return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        performRequest(request: request, completion)
    }
}

