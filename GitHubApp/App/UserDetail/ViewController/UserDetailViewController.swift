//
//  UserDetailViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

protocol UserDetailDisplayProtocol: AnyObject {
    func displayFollowing(with amount: Int)
    func displayFollowers(with amount: Int)
}

class UserDetailViewController: BaseViewController {
    private var customView = UserDetailView()
    
    var interactor: UserDetailInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        interactor?.loadFollowers()
        interactor?.loadFollowing()
    }
}
// MARK: - Configure View
extension UserDetailViewController {
    private func configureView() {
        view = customView
        customView.setLoginName(interactor?.user.login ?? "")
        customView.setUserImage(interactor?.user.avatarURL ?? "")
    }
}
// MARK: - UserDetailDisplayProtocol
extension UserDetailViewController: UserDetailDisplayProtocol {
    func displayFollowing(with amount: Int) {
        customView.setFollowingAmount(amount)
    }
    
    func displayFollowers(with amount: Int) {
        customView.setFollowersAmount(amount)
    }
}
