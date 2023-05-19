//
//  SearchUserPresenter.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserPresenterProtocol {
    func presentUserList(_ users: [User])
    func presentErrorUserList(_ error: Error)
    func presentLoading()
    func presentStopLoading()
}

class SearchUserPresenter: SearchUserPresenterProtocol {
  
    weak var view: SearchUserDisplayProtocol?
    
    init(view: SearchUserDisplayProtocol) {
        self.view = view
    }
    
    func presentUserList(_ users: [User]) {
        view?.displayUserList(with: users)
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
}
