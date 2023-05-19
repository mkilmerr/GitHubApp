//
//  SearchUserTextFieldDelegate.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserTextFieldDelegate: NSObject, UITextFieldDelegate {
    private var view: SearchUserView
    
    init(_ view: SearchUserView) {
        self.view = view
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.searchTextFieldDidTapAnimation()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.searchTextFieldDidReturn()
        textField.resignFirstResponder()
        return true
    }
}
