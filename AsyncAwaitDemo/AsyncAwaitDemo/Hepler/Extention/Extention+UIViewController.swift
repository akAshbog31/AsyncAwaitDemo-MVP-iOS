//
//  Extention+UIViewController.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import UIKit
import MBProgressHUD

enum StoryboardType: String {
    case main = "Main"
}

extension UIViewController {
    class func instantiate<T: UIViewController>(appStoryboard: StoryboardType = .main) -> T {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func pushVc<T: UIViewController>(vc: T.Type, appStoryboard: StoryboardType = .main) {
        let vc = vc.instantiate(appStoryboard: appStoryboard)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVc() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showHUD(progressLabel: String = "Loading...") {
        DispatchQueue.main.async {
            let progressHUD = MBProgressHUD.showAdded(to: (Utils.shared.getSceneDelegate()?.window)!, animated: true)
            progressHUD.label.text = progressLabel
            progressHUD.bezelView.layer.cornerRadius = 18
            progressHUD.bezelView.blurEffectStyle = .systemChromeMaterialDark
            progressHUD.contentColor = .systemBackground
            progressHUD.bezelView.style = .blur
        }
    }
    
    func dismissHUD(isAnimated: Bool = true) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: (Utils.shared.getSceneDelegate()?.window)!, animated: isAnimated)
        }
    }
    
    func showAlertWithTitle(title: String = "Demo", msg: String, options: String..., btnStyle: UIAlertAction.Style..., completion: @escaping ((Int) -> ())) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alert.addAction(UIAlertAction.init(title: option, style: btnStyle[index], handler: { (action) in
                completion(index)
            }))
        }
        var rootViewController = Utils.shared.getSceneDelegate()?.window?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        if let presentedVc = rootViewController?.presentedViewController {
            rootViewController = presentedVc
        }
        rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String = "Demo", msg: String, buttonText: String? = "OK") {
        self.showAlertWithTitle(title: title,msg: msg, options: buttonText ?? "OK", btnStyle: .default, completion: { option in
            switch option {
            case 0: break
            default: break
            }
        })
    }
}

