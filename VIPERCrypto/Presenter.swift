//
//  Presenter.swift
//  VIPERCrypto
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation

enum NetworkError: Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    
    var view: AnyView? {get set}
    var interactor: AnyInteractor? {get set}
    var router: AnyRouter? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {

    var view: AnyView?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCrypto()
        }
    }
    var router: AnyRouter?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(_):
            view?.update(with: "Try again later.")
        }
    }
}
