//
//  SearchUserService.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserServiceProtocol: AnyObject {
    var baseURL: String { get set }
    func loadUsersDefaultList()
}

class SearchUserService: SearchUserServiceProtocol {
    var baseURL: String = "https://api.github.com"
    private lazy var httpGetManager = HTTPGetManager(url: baseURL)
    
    func loadUsersDefaultList() {
        httpGetManager.request { (result: Result<User, Error>) in
            switch result {
            case .success(let data) :
                break
            case .failure(let error):
                break
            }
        }
    }
}
