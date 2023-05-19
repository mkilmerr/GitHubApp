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
        customView.delegate = self
        view = customView
        interactor?.loadUsers()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
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
// MARK: - SearchUserViewDelegate
extension SearchUserViewController: SearchUserViewDelegate {
    func cellDidSelect() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(viewController, animated: true)
    }
}
