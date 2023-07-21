//
//  NetworkManager.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation
import Moya

final class NetworkManager: Networkable {
    internal var provider = MoyaProvider<AsyncAwaitDemo>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { target, items in
        if let log = items.first {
            print(log)
        }
    }, logOptions: .formatRequestAscURL))])
    
    func getMems() async throws -> MainModel {
        return try await request(.getMemes)
    }
}

extension NetworkManager {
    private func request<T: Codable>(_ target: AsyncAwaitDemo) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    guard let res = try? JSONDecoder().decode(T.self, from: response.data) else {
                        continuation.resume(throwing: MoyaError.jsonMapping(response))
                        return
                    }
                    continuation.resume(returning: res)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
