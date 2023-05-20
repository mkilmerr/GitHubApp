//
//  License.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import Foundation

struct License: Codable {
    let key, name, spdxID: String
    let url: String
    let nodeID: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxID = "spdx_id"
        case url = "url"
        case nodeID = "node_id"
    }
}
