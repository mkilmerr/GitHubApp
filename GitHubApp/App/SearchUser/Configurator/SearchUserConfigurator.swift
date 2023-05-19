//
//  SearchUserConfigurator.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import Foundation

protocol SearchUserFactory {
    func buildViewController() -> SearchUserDisplayProtocol
}

final class SearchUserConfigurator: SearchUserFactory {
    func buildViewController() -> SearchUserDisplayProtocol {
        let viewController = SearchUserViewController()
        let presenter = SearchUserPresenter(view: viewController)
        let service = SearchUserService()
        let interactor = SearchUserInteractor(presenter: presenter,
                                              service: service)
        viewController.interactor = interactor
        return viewController
    }
}
