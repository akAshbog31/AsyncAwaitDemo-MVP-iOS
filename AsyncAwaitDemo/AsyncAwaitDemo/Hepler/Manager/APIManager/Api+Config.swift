//
//  Api+Config.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation
import Moya

enum AsyncAwaitDemo {
    case getMemes
}

extension AsyncAwaitDemo: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.imgflip.com/")!
    }
    
    var path: String {
        switch self {
        case .getMemes:
            return "get_memes"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMemes:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMemes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMemes:
            return ["Content-Type": "application/json"]
        }
    }
}


