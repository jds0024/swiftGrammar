//
//  PostModel.swift
//  Blog
//
//  Created by 정다산 on 1/4/24.
//

import Foundation

struct PostModel: Identifiable,Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
