//
//  SearchUserInteractor.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserInteractorProtocol {
    func loadUsers()
    func loadFollowing(with user: User)
    func loadFollowers(with user: User)
    func loadUserInformations(with user: User)
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
        var userInfomations: [UserInformations] = []
        presenter.presentLoading()
        service.loadUsersDefaultList { [weak self] result in
            self?.presenter.presentStopLoading()
            switch result {
            case .success(let users):
                users.forEach { user in
                    self?.service.loadFollowers(loginName: user.login) { [weak self] result in
                        self?.presenter.presentStopLoading()
                        switch result {
                        case .success(let followers):
                            self?.service.loadFollowing(loginName: user.login) { [weak self] result in
                                switch result {
                                case .success(let following):
                                    let userInfo = UserInformations(followers: followers.count, following: following.count)
                                    userInfomations.append(userInfo)
                                    self?.presenter.presentUserList(users,
                                                                    userInformations: userInfomations)
                                  
                                case .failure(let error): break
                                    self?.presenter.presentErrorUserFollowers(error)
                                }
                            }
                        case .failure(let error): break
                            self?.presenter.presentErrorUserFollowing(error)
                        }
                    }
                }
            case .failure(let error):
                self?.presenter.presentErrorUserList(error)
            }
        }
    }
    
    func loadFollowing(with user: User) {
        presenter.presentLoading()
        service.loadFollowing(loginName: user.login) { [weak self] result in
            self?.presenter.presentStopLoading()
            switch result {
            case .success(let users):
                self?.presenter.presentUserFollowing(users)
            case .failure(let error):
                self?.presenter.presentErrorUserFollowing(error)
            }
        }
    }
    
    func loadFollowers(with user: User) {
        presenter.presentLoading()
        service.loadFollowers(loginName: user.login) { [weak self] result in
            self?.presenter.presentStopLoading()
            switch result {
            case .success(let users):
                self?.presenter.presentUserFollowers(users)
            case .failure(let error):
                self?.presenter.presentErrorUserFollowers(error)
            }
        }
    }
    
    func loadUserInformations(with user: User) {
        loadFollowing(with: user)
        loadFollowers(with: user)
    }
}
