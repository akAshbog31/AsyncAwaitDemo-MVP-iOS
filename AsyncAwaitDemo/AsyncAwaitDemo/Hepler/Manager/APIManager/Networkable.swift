//
//  Networkable.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<AsyncAwaitDemo> { get }
    
    func getMems() async throws -> MainModel
}
