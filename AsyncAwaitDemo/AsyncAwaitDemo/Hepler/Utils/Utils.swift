//
//  Utils.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation
import UIKit

final class Utils {
    ///Make `Utils` class `Singletone` using `shared`
    ///Using this variable access this class methods and property without creating instance of this class
    static var shared = Utils()
    private init() {}
    
    ///To get `SceneDelegate` of `Application`
    ///Return: - `SceneDelegate`
    func getSceneDelegate() -> SceneDelegate? {
        guard let delegate = UIApplication.shared.connectedScenes.first else { return nil }
        return delegate.delegate as? SceneDelegate ?? nil
    }
    
    func getAppDelegate() -> AppDelegate? {
        guard let delegate = UIApplication.shared.delegate else { return nil }
        return delegate as? AppDelegate ?? nil
    }
}

