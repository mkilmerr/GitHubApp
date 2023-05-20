//
//  SearchUserViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

protocol SearchUserDisplayProtocol: AnyObject {
    func displayUserList(with userCard: UserCard)
    func displayErrorUserList(with error: Error)
    func displayFollowers(_ amount: Int)
    func displayFollowing(_ amount: Int)
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
    func displayUserList(with users: UserCard) {
        customView.users = users
    }
    
    func displayErrorUserList(with error: Error) {
        
    }
    
    func displayStopLoading() {
        stopAnimating()
    }
    
    func displayLoading() {
        startAnimating()
    }
    
    func displayFollowers(_ amount: Int) {
        
    }
    
    func displayFollowing(_ amount: Int) {
        
    }
}
// MARK: - SearchUserViewDelegate
extension SearchUserViewController: SearchUserViewDelegate {
    func cellDidSelect() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(viewController, animated: true)
    }
}
