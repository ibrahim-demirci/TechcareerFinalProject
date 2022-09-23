//
//  SignInScreenInteractor.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation
import FirebaseAuth

class SignInScreenInteractor: PresenterToInteractorSignInScreenProtocol {
    
    
    func signIn(email: String, password: String, completition: @escaping (Bool)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error != nil {
                print(error!.localizedDescription)
                completition(false)
            } else {
                completition(true)
            }
            
        }
    }
    
    
    
    
}
