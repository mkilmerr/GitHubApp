//
//  Repos.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

struct Repos: Codable {
    let id: Int
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let url: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case url = "html_url"
    }
}
