//
//  SearchUserViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

protocol SearchUserDisplayProtocol: AnyObject {
    func displayUserList(with user: [User])
    func displayErrorUserList(with error: Error)
    func displayErrorUserBySearch()
    func displayLoading()
    func displayStopLoading()
}

class SearchUserViewController: BaseViewController {
    var interactor: SearchUserInteractor?
    var router: SearchUserRouter?
    
    private let customView = SearchUserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
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
        showAlert(message: error.localizedDescription)
    }
    func displayErrorUserBySearch() {
        stopAnimating()
    }
    func displayStopLoading() {
        stopAnimating()
    }
    
    func displayLoading() {
        startAnimating()
    }
}
// MARK: - SearchUserViewDelegate
extension SearchUserViewController: SearchUserViewDelegate {
    func cellDidSelect(with user: User) {
        router?.goToDetail(with: user)
    }
    
    func searchUser(with name: String) {
        interactor?.loadSearchUser(with: name)
    }
}
