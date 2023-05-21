//
//  SearchUserInteractorTests.swift
//  GitHubAppTests
//
//  Created by Marcos Kilmer  on 21/05/23.
//

import XCTest
@testable import GitHubApp

final class SearchUserInteractorTests: XCTestCase {

    func test_loadUsersDefaultList_called() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        sut.loadUsers()
        XCTAssertTrue(serviceSpy.loadUsersDefaultListCalled)
    }
    
    func test_loadUsersDefaultList_not_called() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let _ = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        XCTAssertFalse(serviceSpy.loadUsersDefaultListCalled)
    }
    
    
    func test_loadUsersDefaultList_with_success() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        serviceSpy.loadUsersDefaultListCalledWithError = false
        sut.loadUsers()
        XCTAssertTrue(presenterSpy.presentUserListCalled)
        serviceSpy.loadUsersDefaultList { result in
            switch result {
            case .success(_) :
                XCTAssertTrue(presenterSpy.presentUserListCalled)
            case .failure(_):
                XCTAssertFalse(presenterSpy.presentErrorUserList)
            }
        }
    }
    
    func test_loadUsersDefaultList_with_success_response() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        serviceSpy.loadUsersDefaultListCalledWithError = false
        sut.loadUsers()
        XCTAssertTrue(presenterSpy.presentUserListCalled)
        serviceSpy.loadUsersDefaultList { result in
            switch result {
            case .success(let users) :
                XCTAssertEqual(serviceSpy.mockResponse, users)
            case .failure(_):
                XCTAssertFalse(presenterSpy.presentErrorUserList)
            }
        }
    }
    
    func test_loadUsersDefaultList_with_error() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        serviceSpy.loadUsersDefaultListCalledWithError = true
        sut.loadUsers()
        XCTAssertFalse(presenterSpy.presentUserListCalled)
        serviceSpy.loadUsersDefaultList { result in
            switch result {
            case .success(_) :
                XCTAssertFalse(presenterSpy.presentUserListCalled)
            case .failure(_):
                XCTAssertTrue(presenterSpy.presentErrorUserList)
               
            }
        }
    }
    
    func test_searchUserCalled() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        sut.loadSearchUser(with: "mock")
        XCTAssertTrue(serviceSpy.searchUserCalled)
    }
    
    func test_searchUser_not_called() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let _ = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        
        XCTAssertFalse(serviceSpy.searchUserCalled)
    }
    
    func test_searchUuser_with_sucess() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        let mockRequest = "mock"
        serviceSpy.searchUserCalledWithError = false
        sut.loadSearchUser(with: mockRequest)
        XCTAssertTrue(serviceSpy.searchUserCalled)
        serviceSpy.searchUser(with: mockRequest) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(presenterSpy.presentUserBySeachCalled)
            case .failure(_):
                XCTAssertFalse(presenterSpy.presentErrorUserBySearchCalled)
            }
        }
    }
    
    func test_searchUuser_with_error() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        let mockRequest = "mock"
        serviceSpy.searchUserCalledWithError = true
        sut.loadSearchUser(with: mockRequest)
        XCTAssertTrue(serviceSpy.searchUserCalled)
        serviceSpy.searchUser(with: mockRequest) { result in
            switch result {
            case .success(_):
                XCTAssertFalse(presenterSpy.presentUserBySeachCalled)
            case .failure(_):
                XCTAssertTrue(presenterSpy.presentErrorUserBySearchCalled)
            }
        }
    }
    
    func test_searchUuser_with_sucess_response() {
        let presenterSpy = SearchUserPresenterSpy()
        let serviceSpy = SearchUserServiceSpy()
        let sut = SearchUserInteractor(presenter: presenterSpy,
                                       service: serviceSpy)
        let mockRequest = "mock"
        serviceSpy.searchUserCalledWithError = false
        sut.loadSearchUser(with: mockRequest)
        XCTAssertTrue(serviceSpy.searchUserCalled)
        serviceSpy.searchUser(with: mockRequest) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(serviceSpy.searchUserMockResponse, user)
            case .failure(_):
                XCTAssertFalse(presenterSpy.presentErrorUserBySearchCalled)
            }
        }
    }
}

// MARK: - Service Double
extension SearchUserInteractorTests {
    class SearchUserServiceSpy: SearchUserServiceProtocol {
        var baseURL: String = "baseURL_spy"
        
        var users: String = "users_spy"
        
        var usersBackSlash: String = "users/spy"
        
        var httpGetManager: GitHubApp.HTTPGetManager?
        
        var loadUsersDefaultListCalled = false
        var loadUsersDefaultListCalledWithError = false
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
        
        func loadUsersDefaultList(completion: @escaping (Result<[User], Error>) -> Void) {
            loadUsersDefaultListCalled = true

            if loadUsersDefaultListCalledWithError {
                completion(.failure(HTTPError.unexpected))
            } else {
                completion(.success(mockResponse))
            }
        }
        
        var searchUserCalled = false
        var searchUserCalledWithError = false
        let searchUserMockResponse = User(login: "", id: 1, nodeId: "", avatarURL: "", gravaterId: "", url: "", htmlURL: "", followersURL: "", followingURL: "", gistsURL: "", starredURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", eventsURL: "", receivedEventsURL: "", type: "", siteAdmin: false)
        
        func searchUser(with name: String,
                        completion: @escaping (Result<User, Error>) -> Void) {
            searchUserCalled = true
            if searchUserCalledWithError {
                completion(.failure(HTTPError.unexpected))
            } else {
                completion(.success(searchUserMockResponse))
            }
        }
    }
}

// MARK: - Presenter Double
extension SearchUserInteractorTests {
    class SearchUserPresenterSpy: SearchUserPresenterProtocol {
        var presentUserListCalled = false
        func presentUserList(_ users: [User]) {
            presentUserListCalled = true
        }
        
        var presentUserBySeachCalled = false
        func presentUserBySeach(user: User) {
            presentUserBySeachCalled = true
        }
        
        var presentErrorUserBySearchCalled = false
        func presentErrorUserBySearch() {
            presentErrorUserBySearchCalled = true
        }
        
        var presentErrorUserList = false
        func presentErrorUserList(_ error: Error) {
            presentErrorUserList = true
        }
        
        var presentLoadingCalled = false
        func presentLoading() {
            presentLoadingCalled = true
        }
        
        var presentStopLoadingCalled = false
        func presentStopLoading() {
            presentStopLoadingCalled = true
        }
    }
}
