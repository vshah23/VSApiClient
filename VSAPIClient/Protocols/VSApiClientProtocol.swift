//
//  ApiClientProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

public enum VSApiResponseStatus {
    case Success(HTTPURLResponse)
    case Failure(Error?)
}

public protocol VSApiClientProtocol {
    func get(_ url: String, queryParams: [URLQueryItem]?, completion: @escaping (VSApiResponseStatus) -> Void)
    func post(_ url: String, _ completion: @escaping (VSApiResponseStatus) -> Void)
}
