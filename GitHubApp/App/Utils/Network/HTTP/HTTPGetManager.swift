//
//  HTTPGetManager.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol HTTPGetProtocol {
    var url: String { get set }
    func request(completion: @escaping (Result<Data, Error>) -> Void)
}

class HTTPGetManager: HTTPGetProtocol {
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func request(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(HTTPError.invalidURL))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(HTTPError.unexpected))
                return
            }
            completion(.success(data))
        }
        
        task.resume()
    }
}
