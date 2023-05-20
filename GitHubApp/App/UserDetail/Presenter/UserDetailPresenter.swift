//
//  UserDetailPresenter.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

protocol UserDetailPresenterProtocol: AnyObject {
    func presentFollowing(_ users: [User])
    func presentFollowers(_ users: [User])
    func presentRepos(_ repos: [Repos])
    func presentAlert()
}

class UserDetailPresenter: UserDetailPresenterProtocol {
    private weak var view: UserDetailDisplayProtocol?
    
    init(view: UserDetailDisplayProtocol) {
        self.view = view
    }
    
    func presentFollowing(_ users: [User]) {
        view?.displayFollowing(with: users.count)
    }
    
    func presentFollowers(_ users: [User]) {
        view?.displayFollowers(with: users.count)
    }
    
    func presentRepos(_ repos: [Repos]) {
        view?.displayRepos(repos)
    }
    
    func presentAlert() {
        view?.displayShowAlert()
    }
}
