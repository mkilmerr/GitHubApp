//
//  UserDetailInteractor.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

protocol UserDetailInteractorProtocol: AnyObject {
    func loadFollowers()
    func loadFollowing()
}

class UserDetailInteractor: UserDetailInteractorProtocol {
    private var service: UserDetailServiceProtocol
    private var presenter: UserDetailPresenterProtocol
    public var user: User
    init(service: UserDetailServiceProtocol,
         presenter: UserDetailPresenterProtocol,
         user: User) {
        self.service = service
        self.presenter = presenter
        self.user = user
    }
    
    func loadFollowers() {
        service.loadFollowers(loginName: user.login) { [weak self] result in
            switch result {
            case .success(let users):
                self?.presenter.presentFollowers(users)
            case .failure(let error) : break
            }
        }
    }
    
    func loadFollowing() {
        service.loadFollowing(loginName: user.login) { [weak self] result in
            switch result {
            case .success(let users):
                self?.presenter.presentFollowing(users)
            case .failure(let error) : break
            }
        }
    }
}
