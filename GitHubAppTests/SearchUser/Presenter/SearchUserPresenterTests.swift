//
//  SearchUserPresenterTests.swift
//  GitHubAppTests
//
//  Created by Marcos Kilmer  on 21/05/23.
//

import XCTest
@testable import GitHubApp

class SearchUserPresenterTests: XCTestCase {
    let mockList = [User(login: "",
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
    
    func test_presentUserList_called() {
        let viewSpy = SearchUserDisplaySpy()
        let sut = SearchUserPresenter(view: viewSpy)
        
        sut.presentUserList(mockList)
        XCTAssertTrue(viewSpy.displayUserListCalled)
        
    }
    
    func test_presentUserList_not_called() {
        let viewSpy = SearchUserDisplaySpy()
        let _ = SearchUserPresenter(view: viewSpy)

        XCTAssertFalse(viewSpy.displayUserListCalled)
    }
    
    func test_presentUserBySeach_called() {
        let viewSpy = SearchUserDisplaySpy()
        let sut = SearchUserPresenter(view: viewSpy)
        
        guard let user = mockList.first else { return }
        sut.presentUserBySeach(user: user)
        XCTAssertTrue(viewSpy.displayUserListCalled)
    }
    
    func test_presentUserBySeach_not_called() {
        let viewSpy = SearchUserDisplaySpy()
        let _ = SearchUserPresenter(view: viewSpy)
        
        XCTAssertFalse(viewSpy.displayUserListCalled)
    }
    
    func test_presentLoading_called() {
        let viewSpy = SearchUserDisplaySpy()
        let sut = SearchUserPresenter(view: viewSpy)
        
        sut.presentLoading()
        XCTAssertTrue(viewSpy.displayLoadingCalled)
    }
    
    func test_presentLoading_not_called() {
        let viewSpy = SearchUserDisplaySpy()
        let _ = SearchUserPresenter(view: viewSpy)
        
        XCTAssertFalse(viewSpy.displayLoadingCalled)
    }
    
    func test_presentErrorUserBySearch_called() {
        let viewSpy = SearchUserDisplaySpy()
        let sut = SearchUserPresenter(view: viewSpy)
        
        sut.presentErrorUserBySearch()
        XCTAssertTrue(viewSpy.displayErrorUserBySearchCalled)
    }
}

// MARK:  - Display Double
extension SearchUserPresenterTests {
    class SearchUserDisplaySpy: SearchUserDisplayProtocol {
      
        var displayUserListCalled = false
        func displayUserList(with user: [User]) {
            displayUserListCalled = true
        }
        
        var displayErrorUserListCalled = false
        func displayErrorUserList(with error: Error) {
            displayErrorUserListCalled = true
        }
        
        var displayErrorUserBySearchCalled = false
        func displayErrorUserBySearch() {
            displayErrorUserBySearchCalled = true
        }
        
        var displayLoadingCalled = false
        func displayLoading() {
            displayLoadingCalled = true
        }
        
        var displayStopLoadingCalled = false
        func displayStopLoading() {
            displayStopLoadingCalled = true
        }
    }
}
