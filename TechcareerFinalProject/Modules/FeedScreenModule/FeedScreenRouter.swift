//
//  FeedScreenRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

class FeedScreenRouter: PresenterToRouterFeedScreenProtocol {
    
    static func createModule(ref: FeedScreenViewController) {
        
        let presenter = FeedScreenPresenter()
        
        ref.presenter = presenter
                
        ref.presenter?.interactor = FeedScreenInteractor()
        ref.presenter?.view = ref
        
        ref.presenter?.interactor?.presenter = presenter
        
    }
    
}
