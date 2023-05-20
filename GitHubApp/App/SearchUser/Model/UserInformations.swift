//
//  UserInformations.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

struct UserInformations {
    let followers: Int
    let following: Int
}

struct UserCard {
    let user: [User]
    let informations: [UserInformations]
}
