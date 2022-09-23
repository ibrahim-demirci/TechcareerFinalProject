//
//  SignInScreenRouter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation


class SignInScreenRouter: PresenterToRouterSignInScreenProtocol {
    
    static func createModule(ref: SignInViewController ) {
        
        ref.presenter = SignInScreenPresenter()
        
        ref.presenter?.interactor = SignInScreenInteractor()
    }
}
