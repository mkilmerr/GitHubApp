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
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        guard let stringRange = Range(range, in: text) else { return true }
        let updatedText = text.replacingCharacters(in: stringRange, with: string)
        view.delegate?.searchUser(with: updatedText)
        return true
       
    }
}
