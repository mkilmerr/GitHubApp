//
//  HTTPHeaders.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 21/05/23.
//

import Foundation

class HTTPHeaders {
    static func getHeaders(with token: String) -> [String: String]{
        let headers = [
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer \(token)"
        ]
        return headers
    }
}
