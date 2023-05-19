//
//  SearchUserViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

protocol SearchUserDisplayProtocol: AnyObject {
    func displayUserList(with users: [User])
    func displayErrorUserList(with error: Error)
}

class SearchUserViewController: UIViewController {
    var interactor: SearchUserInteractor?
    private let customView = SearchUserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        interactor?.loadUsers()
    }
}

// MARK: - SearchUserDisplayProtocol
extension SearchUserViewController: SearchUserDisplayProtocol {
    func displayUserList(with users: [User]) {
        customView.users = users
    }
    
    func displayErrorUserList(with error: Error) {
        
    }
}
