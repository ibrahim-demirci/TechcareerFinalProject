//
//  CartScreenRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation

class CartScreenRouter: PresenterToRouterCartScreenProtocol {
   
    
    static func createModule(ref: CartScreenViewController) {
        
        let presenter = CartScreenPresenter()
        
        ref.presenter = presenter
                
        ref.presenter?.interactor = CartScreenInteractor()
        ref.presenter?.view = ref
        
        ref.presenter?.interactor?.presenter = presenter
        
    }
    
    
}
