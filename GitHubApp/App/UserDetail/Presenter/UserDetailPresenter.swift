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

}
