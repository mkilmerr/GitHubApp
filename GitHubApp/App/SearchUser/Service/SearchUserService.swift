//
//  SearchUserService.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserServiceProtocol: AnyObject {
    var baseURL: String { get set }
    var users: String { get set }
    var httpGetManager: HTTPGetManager? { get set }
    func loadUsersDefaultList(completion: @escaping (Result<[User], Error>) -> Void)
}

class SearchUserService: SearchUserServiceProtocol {
   
    var baseURL: String = "https://api.github.com"
    var users: String = "/users"
    var httpGetManager: HTTPGetManager?
    
    func loadUsersDefaultList(completion: @escaping (Result<[User], Error>) -> Void) {
        httpGetManager = HTTPGetManager(url: "\(baseURL)\(users)")
        httpGetManager?.request { (result: Result<[User], Error>) in
            switch result {
            case .success(let data) :
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
