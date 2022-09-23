//
//  SignUpScreenInteractir.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation
import FirebaseAuth

class SignUpScreenInteractor: PresenterToInteractorSignUpScreenProtocol {
    
    
    func signUp(email: String, password: String, completition: @escaping (Bool)->()) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if error != nil {
                print(error?.localizedDescription)
                completition(true)
            } else {
                completition(false)
            }
            
        }
    }
    
    
    
    
}
