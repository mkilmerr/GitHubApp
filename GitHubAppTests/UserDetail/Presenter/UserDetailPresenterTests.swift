//
//  UserDetailPresenterTests.swift
//  GitHubAppTests
//
//  Created by Marcos Kilmer  on 21/05/23.
//

import XCTest
@testable import GitHubApp
final class UserDetailPresenterTests: XCTestCase {
    let mockUsers = [User(login: "",
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
    
    let mockRepos = [Repos(id: 1,
                           fullName: "",
                           description: "",
                           stargazersCount: 1,
                           url: URL(string: "https://www.google.com/")!)]
    
    func test_presentFollowing_called() {
        let viewSpy = UserDetailDisplaySpy()
        let sut = UserDetailPresenter(view: viewSpy)
        
        sut.presentFollowing(mockUsers)
        
        XCTAssertTrue(viewSpy.displayFollowingCalled)
    }
    
    func test_presentFollowing_not_called() {
        let viewSpy = UserDetailDisplaySpy()
        let _ = UserDetailPresenter(view: viewSpy)
    
        XCTAssertFalse(viewSpy.displayFollowingCalled)
    }
    
    func test_presentFollowers_called() {
        let viewSpy = UserDetailDisplaySpy()
        let sut = UserDetailPresenter(view: viewSpy)
        
        sut.presentFollowers(mockUsers)
        
        XCTAssertTrue(viewSpy.displayFollowersCalled)
    }
    
    func test_presentFollowers_not_called() {
        let viewSpy = UserDetailDisplaySpy()
        let _ = UserDetailPresenter(view: viewSpy)
        
        XCTAssertFalse(viewSpy.displayFollowersCalled)
    }
    
    func test_presentRepos_called() {
        let viewSpy = UserDetailDisplaySpy()
        let sut = UserDetailPresenter(view: viewSpy)
        
        sut.presentRepos(mockRepos)
        
        XCTAssertTrue(viewSpy.displayReposCalled)
    }
    
    func test_presentRepos_not_called() {
        let viewSpy = UserDetailDisplaySpy()
        let _ = UserDetailPresenter(view: viewSpy)
        
        XCTAssertFalse(viewSpy.displayReposCalled)
    }
}

// MARK: - SearchUserDisplayProtocol
extension UserDetailPresenterTests {
    class UserDetailDisplaySpy: UserDetailDisplayProtocol {
        var displayFollowingCalled = false
        func displayFollowing(with amount: Int) {
            displayFollowingCalled = true
        }
        
        var displayFollowersCalled = false
        func displayFollowers(with amount: Int) {
            displayFollowersCalled = true
        }
        
        var displayReposCalled = false
        func displayRepos(_ repos: [GitHubApp.Repos]) {
            displayReposCalled = true
        }
        
        var displayShowAlertCalled = false
        func displayShowAlert() {
            displayShowAlertCalled = true
        }
    }
}
