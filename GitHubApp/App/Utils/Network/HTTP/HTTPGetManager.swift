//
//  HTTPGetManager.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol HTTPGetProtocol {
    var url: String { get set }
    func request<T: Codable>(completion: @escaping (Result<T, Error>) -> Void)
}

class HTTPGetManager: HTTPGetProtocol {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func request<T>(completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
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
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(HTTPError.unexpected))
            }
        }
        
        task.resume()
    }
}
