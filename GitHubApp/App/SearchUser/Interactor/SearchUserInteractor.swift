//
//  SearchUserInteractor.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserInteractorProtocol {
    func loadUsers()
    func loadSearchUser(with name: String)
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
        presenter.presentLoading()
        service.loadUsersDefaultList { [weak self] result in
            self?.presenter.presentStopLoading()
            switch result {
            case .success(let users):
                self?.presenter.presentUserList(users)
            case .failure(let error):
                self?.presenter.presentErrorUserList(error)
            }
        }
    }
        
    func loadSearchUser(with name: String) {
        if name == "" { loadUsers() }
        service.searchUser(with: name) { [weak self] result in
            switch result {
            case .success(let user):
                self?.presenter.presentUserBySeach(user: user)
            case .failure(_):
                self?.presenter.presentErrorUserBySearch()
            }
        }
    }
}
