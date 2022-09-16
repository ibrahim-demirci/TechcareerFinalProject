//
//  FeedScreenRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

class FeedScreenRouter: PresenterToRouterProtocol {
    
    static func createModule(ref: FeedScreenViewController) {
        
        ref.presenter = FeedScreenPresenter()
        
        ref.presenter?.interactor = FeedScreenInteractor()
        
    }
    
    
}
