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
    private var presenter: SearchUserPresenterProtocol
    private var service: SearchUserServiceProtocol
    
    init(presenter: SearchUserPresenterProtocol,
         service: SearchUserServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
    
    func loadUsers() {
        service.loadUsersDefaultList { [weak self] result in
            switch result {
            case .success(let users):
                self?.presenter.presentUserList(users)
            case .failure(let error):
                self?.presenter.presentErrorUserList(error)
            }
        }
    }
}
