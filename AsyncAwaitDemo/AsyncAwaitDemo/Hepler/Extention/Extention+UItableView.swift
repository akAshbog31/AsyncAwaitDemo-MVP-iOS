//
//  Extention+UItableView.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib<cell : UITableViewCell>(cell : cell.Type){
        let nibName = String(describing: cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func deque<cell : UITableViewCell>()-> cell{
        let identifier = String(describing: cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? cell
            else {fatalError("=====>Error in cell") }
        return cell
    }
}

