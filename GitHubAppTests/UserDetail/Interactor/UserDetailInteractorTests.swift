//
//  UserDetailInteractorTests.swift
//  GitHubAppTests
//
//  Created by Marcos Kilmer  on 21/05/23.
//

import XCTest
@testable import GitHubApp

final class UserDetailInteractorTests: XCTestCase {
    let mockUser = User(login: "",
                        id: 1,
                        nodeId: "",
                        avatarURL: "",
                        gravaterId: "",
                        url: "",
                        htmlURL: "",
                        followersURL: "",
                        followingURL: "",
                        gistsURL: "",
                        starredURL: "",
                        subscriptionsURL: "",
                        organizationsURL: "",
                        reposURL: "",
                        eventsURL: "",
                        receivedEventsURL: "",
                        type: "",
                        siteAdmin: false)
    
    func test_loadFollowers_called() {
        let presenterSpy = UserDetailPresenterSpy()
        let serviceSpy = UserDetailServiceSpy()
        let sut = UserDetailInteractor(service: serviceSpy,
                                       presenter: presenterSpy,
                                       user: mockUser)
        
        sut.loadFollowers()
        XCTAssertTrue(serviceSpy.loadFollowersCalled)
    }
    
    func test_loadFollowing_called() {
        let presenterSpy = UserDetailPresenterSpy()
        let serviceSpy = UserDetailServiceSpy()
        let sut = UserDetailInteractor(service: serviceSpy,
                                       presenter: presenterSpy,
                                       user: mockUser)
        
        sut.loadFollowing()
        XCTAssertTrue(serviceSpy.loadFollowingCalled)
    }
    
    func test_loadFollowers_called_with_success() {
        let presenterSpy = UserDetailPresenterSpy()
        let serviceSpy = UserDetailServiceSpy()
        let sut = UserDetailInteractor(service: serviceSpy,
                                       presenter: presenterSpy,
                                       user: mockUser)
        
        serviceSpy.loadFollowersCalledWithError = false
        sut.loadFollowers()
        XCTAssertTrue(serviceSpy.loadFollowersCalled)
        serviceSpy.loadRepositories(loginName: "") { result in
            switch result {
            case .success(_):
                XCTAssertTrue(presenterSpy.presentFollowersCalled)
            case .failure(_):
                XCTAssertFalse(presenterSpy.presentAlertCalled)
            }
        }
    }
    
    
    func test_loadFollowers_called_with_error() {
        let presenterSpy = UserDetailPresenterSpy()
        let serviceSpy = UserDetailServiceSpy()
        let sut = UserDetailInteractor(service: serviceSpy,
                                       presenter: presenterSpy,
                                       user: mockUser)
        
        serviceSpy.loadFollowersCalledWithError = true
        sut.loadFollowers()
        XCTAssertTrue(serviceSpy.loadFollowersCalled)
        serviceSpy.loadRepositories(loginName: "") { result in
            switch result {
            case .success(_):
                XCTAssertFalse(presenterSpy.presentFollowersCalled)
            case .failure(_):
                XCTAssertTrue(presenterSpy.presentAlertCalled)
            }
        }
    }
}

// MARK: - Service Double
extension UserDetailInteractorTests {
    class UserDetailServiceSpy: UserDetailServiceProtocol {
        var baseURL: String = "mock"
        
        var users: String = "mock"
        
        var repos: String = "mock"
        
        var followers: String = "mock"
        
        var following: String = "mock"
        
        var httpGetManager: HTTPGetManager?
        
        let mockResponse = [User(login: "",
                                 id: 1,
                                 nodeId: "",
                                 avatarURL: "",
                                 gravaterId: "",
                                 url: "",
                                 htmlURL: "",
                                 followersURL: "",
                                 followingURL: "",
                                 gistsURL: "",
                                 starredURL: "",
                                 subscriptionsURL: "",
                                 organizationsURL: "",
                                 reposURL: "",
                                 eventsURL: "",
                                 receivedEventsURL: "",
                                 type: "",
                                 siteAdmin: false)]
        
        let mockRepoResponse = [Repos(id: 1,
                                      fullName: "",
                                      description: "",
                                      stargazersCount: 1,
                                      url: URL(string: "https://www.google.com/")!)]
        
        var loadFollowersCalled = false
        var loadFollowersCalledWithError = false
        func loadFollowers(loginName: String,
                           completion: @escaping (Result<[User], Error>) -> Void) {
            loadFollowersCalled = true
            
            if loadFollowersCalledWithError {
                completion(.failure(HTTPError.unexpected))
            } else {
                completion(.success(mockResponse))
            }
        }
        
        var loadFollowingCalled = false
        var loadFollowingCalledWithError = false
        func loadFollowing(loginName: String,
                           completion: @escaping (Result<[User], Error>) -> Void) {
            loadFollowingCalled = true
            
            if loadFollowingCalledWithError {
                completion(.failure(HTTPError.unexpected))
            } else {
                completion(.success(mockResponse))
            }
        }
        
        var loadRepositoriesCalled = false
        var loadRepositoriesCalledWithError = false
        func loadRepositories(loginName: String,
                              completion: @escaping (Result<[Repos], Error>) -> Void) {
            loadRepositoriesCalled = true
            
            if loadRepositoriesCalledWithError {
                completion(.failure(HTTPError.unexpected))
            } else {
                completion(.success(mockRepoResponse))
            }
        }
        
    }
}

// MARK: - Presenter Spy
extension UserDetailInteractorTests {
    class UserDetailPresenterSpy: UserDetailPresenterProtocol {
        var presentFollowingCalled = false
        func presentFollowing(_ users: [User]) {
            presentFollowingCalled = true
        }
        
        var presentFollowersCalled = false
        func presentFollowers(_ users: [User]) {
            presentFollowersCalled = true
        }
        
        var presentReposCalled = false
        func presentRepos(_ repos: [Repos]) {
            presentReposCalled = true
        }
        
        var presentAlertCalled = false
        func presentAlert() {
            presentAlertCalled = true
        }
    }
}
