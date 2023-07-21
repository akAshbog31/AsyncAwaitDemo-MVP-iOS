//
//  SceneDelegate.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        setVc(vc: .home)
    }
    
    private func setVc(vc: ViewControllerType) {
        let homeVc = UINavigationController(rootViewController: HomeVc.instantiate())
        switch vc {
        case .home:
            window?.rootViewController = homeVc
        }
        window?.makeKeyAndVisible()
    }
}

enum ViewControllerType {
    case home
}

