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
    func displayLoading()
    func displayStopLoading()
}

class SearchUserViewController: BaseViewController {
    var interactor: SearchUserInteractor?
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
    
    func displayStopLoading() {
        stopAnimating()
    }
    
    func displayLoading() {
        startAnimating()
    }
}
// MARK: - SearchUserViewDelegate
extension SearchUserViewController: SearchUserViewDelegate {
    func cellDidSelect() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func searchUser(with name: String) {
        interactor?.loadSearchUser(with: name)
    }
}
