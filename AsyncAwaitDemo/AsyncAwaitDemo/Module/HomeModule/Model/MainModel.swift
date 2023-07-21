//
//  MainModel.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation

struct MainModel: Codable {
    var success: Bool?
    var data: MemsModel?
}

struct MemsModel: Codable {
    var memes: [Mems]?
}

struct Mems: Codable {
    var id: String?
    var name: String?
    var url: String?
    var width: Int?
    var height: Int?
    var box_count: Int?
}
