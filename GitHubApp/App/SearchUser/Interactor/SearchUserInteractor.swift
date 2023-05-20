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
    func loadUserInformations(with users: [User])
    func loadUserInformations(with user: User)
    func loadSearchUser(with name: String)
}

class SearchUserInteractor: SearchUserInteractorProtocol {
    var userInfomations: [UserInformations] = []
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
                self?.loadUserInformations(with: users)
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
    
    func loadUserInformations(with users: [User]) {
        users.forEach { user in
            service.loadFollowers(loginName: user.login) { [weak self] result in
                guard let self = self else { return }
                self.presenter.presentStopLoading()
                switch result {
                case .success(let followers):
                    self.service.loadFollowing(loginName: user.login) { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .success(let following):
                            let userInfo = UserInformations(followers: followers.count, following: following.count)
                            self.userInfomations.append(userInfo)
                            self.presenter.presentUserList(users,
                                                            userInformations: self.userInfomations)
                            
                        case .failure(let error): break
                            self.presenter.presentErrorUserFollowers(error)
                        }
                    }
                case .failure(let error): break
                    self.presenter.presentErrorUserFollowing(error)
                }
            }
        }
    }
    
    func loadUserInformations(with user: User) {
        service.loadFollowers(loginName: user.login) { [weak self] result in
            guard let self = self else { return }
            self.presenter.presentStopLoading()
            switch result {
            case .success(let followers):
                self.service.loadFollowing(loginName: user.login) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let following):
                        let userInfo = UserInformations(followers: followers.count, following: following.count)
                        self.userInfomations.append(userInfo)
                        self.presenter.presentUserList([user],
                                                        userInformations: self.userInfomations)
                        
                    case .failure(let error): break
                        self.presenter.presentErrorUserFollowers(error)
                    }
                }
            case .failure(let error): break
                self.presenter.presentErrorUserFollowing(error)
            }
        }

    }
    
    func loadSearchUser(with name: String) {
        service.searchUser(with: name) { [weak self] result in
            switch result {
            case .success(let users):
                self?.loadUserInformations(with: users)
            case .failure(let error):
                self?.presenter.presentErrorUserFollowers(error)
            }
        }
    }
}
