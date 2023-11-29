//
//  Router.swift
//  VIPERCrypto
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry : EntryPoint? { get }
    
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view: AnyView = CryptoView()
        var presenter: AnyPresenter = CryptoPresenter()
        var interactor: AnyInteractor =  CryptoInteractor()
        
        interactor.presenter = presenter
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
