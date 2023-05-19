//
//  UserSearchPresenter.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol UserSearchPresenterProtocol {
    func presentUserList(_ users: [User])
    func presentErrorUserList(_ error: Error)
}

class UserSearchPresenter: UserSearchPresenterProtocol {
    func presentUserList(_ users: [User]) {
        
    }
    
    func presentErrorUserList(_ error: Error) {
        
    }
}
