//
//  SignUpScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation

class SignUpScreenPresenter: ViewToPresenterSignUpScreenProtocol {
   
    var interactor: PresenterToInteractorSignUpScreenProtocol?
    
    func signUp(email: String, password: String, completition: @escaping (Bool) -> ()) {
        interactor?.signUp(email: email, password: password, completition: { isError in
            completition(isError)
        })
    }
    
    
}
