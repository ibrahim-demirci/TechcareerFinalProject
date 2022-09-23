//
//  SignInScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation


class SignInScreenPresenter: ViewToPresenterSignInScreenProtocol {
   
    var interactor: PresenterToInteractorSignInScreenProtocol?
    
    func signIn(email: String, password: String, completition: @escaping (Bool) -> ()) {
        interactor?.signIn(email: email, password: password, completition: { isError in
            completition(isError)
        })
    }
    
    
}

