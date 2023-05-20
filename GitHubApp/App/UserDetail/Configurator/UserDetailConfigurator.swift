//
//  UserDetailConfigurator.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation


protocol UserDetailFactory {
    func buildViewController(_ user: User) -> UserDetailDisplayProtocol
}

final class UserDetailConfigurator: UserDetailFactory {
    func buildViewController(_ user: User) -> UserDetailDisplayProtocol {
        let viewController = UserDetailViewController()
        let presenter = UserDetailPresenter(view: viewController)
        let service = UserDetailService()
        let interactor = UserDetailInteractor(service: service,
                                              presenter: presenter,
                                              user: user)
     
        viewController.interactor = interactor
        return viewController
    }
}
