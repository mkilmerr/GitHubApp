//
//  UserDetailService.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

protocol UserDetailServiceProtocol: AnyObject {
    var baseURL: String { get set }
    var users: String { get set }
    var repos: String { get set }
    var followers: String { get set }
    var following: String { get set }
    var httpGetManager: HTTPGetManager? { get set }
    
    func loadFollowers(loginName: String,
                       completion: @escaping (Result<[User], Error>) -> Void)
    func loadFollowing(loginName: String,
                       completion: @escaping (Result<[User], Error>) -> Void)
    func loadRepositories(loginName: String,
                          completion: @escaping (Result<[Repos], Error>) -> Void)
}

class UserDetailService: UserDetailServiceProtocol {
    var baseURL: String = "https://api.github.com"
    var users: String = "/users/"
    var followers: String = "/followers"
    var following: String = "/following"
    var repos: String = "/repos"
    var httpGetManager: HTTPGetManager?
    
    func loadFollowers(loginName: String,
                       completion: @escaping (Result<[User], Error>) -> Void) {
        httpGetManager = HTTPGetManager(url: "\(baseURL)\(users)\(loginName)\(followers)")
        httpGetManager?.request { (result: Result<[User], Error>) in
            switch result {
            case .success(let data) :
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadFollowing(loginName: String,
                       completion: @escaping (Result<[User], Error>) -> Void) {
        httpGetManager = HTTPGetManager(url: "\(baseURL)\(users)\(loginName)\(following)")
        httpGetManager?.request { (result: Result<[User], Error>) in
            switch result {
            case .success(let data) :
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadRepositories(loginName: String, completion: @escaping (Result<[Repos], Error>) -> Void) {
        httpGetManager = HTTPGetManager(url: "\(baseURL)\(users)\(loginName)\(repos)")
        httpGetManager?.request { (result: Result<[Repos], Error>) in
            switch result {
            case .success(let data) :
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
