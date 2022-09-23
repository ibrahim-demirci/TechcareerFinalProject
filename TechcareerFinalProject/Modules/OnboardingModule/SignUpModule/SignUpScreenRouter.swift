//
//  SignUpScreenRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation

class SignUpScreenRouter: PresenterToRouterSignUpScreenProtocol {
    
    static func createModule(ref: SignUpViewController ) {
        
        ref.presenter = SignUpScreenPresenter()
        
        ref.presenter?.interactor = SignUpScreenInteractor()
    }
}
