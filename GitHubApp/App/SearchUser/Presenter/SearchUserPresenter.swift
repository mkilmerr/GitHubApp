//
//  SearchUserPresenter.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserPresenterProtocol {
    func presentUserList(_ users: [User], userInformations: [UserInformations])
    func presentErrorUserList(_ error: Error)
    func presentUserFollowers(_ users: [User])
    func presentErrorUserFollowers(_ error: Error)
    func presentUserFollowing(_ users: [User])
    func presentErrorUserFollowing(_ error: Error)
    func presentLoading()
    func presentStopLoading()
}

class SearchUserPresenter: SearchUserPresenterProtocol {
   
    weak var view: SearchUserDisplayProtocol?
    
    init(view: SearchUserDisplayProtocol) {
        self.view = view
    }
    
    func presentUserList(_ users: [User], userInformations: [UserInformations]) {
        let userCard = UserCard(user: users, informations: userInformations)
        view?.displayUserList(with: userCard)
    }
    
    func presentErrorUserList(_ error: Error) {
        view?.displayErrorUserList(with: error)
    }
    
    func presentLoading() {
        view?.displayLoading()
    }
    
    func presentStopLoading() {
        view?.displayStopLoading()
    }
    
    func presentUserFollowers(_ users: [User]) {
        view?.displayFollowers(users.count)
    }
    
    func presentErrorUserFollowers(_ error: Error) {
        
    }
    
    func presentUserFollowing(_ users: [User]) {
        view?.displayFollowing(users.count)
    }
    
    func presentErrorUserFollowing(_ error: Error) {
        
    }
}
