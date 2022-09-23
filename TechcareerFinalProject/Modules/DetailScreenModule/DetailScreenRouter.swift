//
//  DetailScreneRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation

class DetailScreenRouter: PresenterToRouterDetailScreenProtocol {
    
    static func createModule(ref: DetailScreenViewController) {
        
        ref.presenter = DetailScreenPresenter()
        
        ref.presenter?.interactor = DetailScreenInteractor()
    }
}
