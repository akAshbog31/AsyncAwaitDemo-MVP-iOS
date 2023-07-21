//
//  ViewController.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import UIKit


final class HomeVc: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var tbl: UITableView!
    
    //MARK: - Properties
    private var presenter: HomePresenter?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        presenter = HomePresenter(view: self)
        presenter?.getMemes()
    }
    
    //MARK: - @IBAction
    
    //MARK: - Functions
    private func setUI() {
        tbl.registerNib(cell: MainCell.self)
        tbl.separatorStyle = .none
        tbl.delegate = self
        tbl.dataSource = self
    }
}

//MARK: - HomePresenterView
extension HomeVc: HomePresenterView {
    func loading(isLoading: Bool) {
        isLoading ? showHUD() : dismissHUD()
    }
    
    func showAlert(errorMsg: String) {
        showAlert(msg: errorMsg)
    }
    
    func memsGetSuccessfully() {
        tbl.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.mems?.data?.memes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainCell = tbl.deque()
        cell.lblDesc.text = presenter?.mems?.data?.memes?[indexPath.row].name
        return cell
    }
}

