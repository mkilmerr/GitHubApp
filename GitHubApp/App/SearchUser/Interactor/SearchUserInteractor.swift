//
//  SearchUserInteractor.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserInteractorProtocol {
    func loadUsers()
}

class SearchUserInteractor: SearchUserInteractorProtocol {
    private var service: SearchUserServiceProtocol
    
    init(service: SearchUserServiceProtocol) {
        self.service = service
    }
    
    func loadUsers() {
        service.loadUsersDefaultList { result in
            switch result {
            case .success(let users) : break
            case .failure(let error): break
            }
        }
    }
}
