//
//  HomePresenter.swift
//  AsyncAwaitDemo
//
//  Created by iOS Developer on 20/07/23.
//

import Foundation

protocol HomePresenterView: AnyObject {
    func loading(isLoading: Bool)
    func showAlert(errorMsg: String)
    func memsGetSuccessfully()
}

@MainActor final class HomePresenter {
    //MARK: - Properties
    weak var view: (HomePresenterView)?
    var networkable: Networkable
    var mems: MainModel?
    
    //MARK: - LifeCycle
    init(view: HomePresenterView, networkable: Networkable = NetworkManager()) {
        self.view = view
        self.networkable = networkable
    }
    
    //MARK: - Functions
    func getMemes() {
        view?.loading(isLoading: true)
        Task {
            do {
                let mems = try await networkable.getMems()
                self.mems = mems
                view?.loading(isLoading: false)
                view?.memsGetSuccessfully()
            } catch {
                view?.loading(isLoading: false)
                view?.showAlert(errorMsg: error.localizedDescription)
            }
        }
    }
}
