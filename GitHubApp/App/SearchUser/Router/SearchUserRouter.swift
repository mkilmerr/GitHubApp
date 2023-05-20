//
//  SearchUserRouter.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

protocol SearchUserRouterProtocol: AnyObject {
    func goToDetail(with user: User)
}

class SearchUserRouter: SearchUserRouterProtocol {
    private weak var viewController: SearchUserViewController?
    
    init(viewController: SearchUserViewController) {
        self.viewController = viewController
    }
    
    func goToDetail(with user: User) {
        guard let userDetailViewController = UserDetailConfigurator().buildViewController(user) as? UserDetailViewController else { return }
        viewController?
            .navigationController?
            .pushViewController(userDetailViewController,
                                animated: true)
    }
}
