//
//  parseModel.swift
//  network_assignment_3
//
//  Created by Consultant on 5/1/22.
//

import Foundation
struct Response: Codable{
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var download_url: String
}
