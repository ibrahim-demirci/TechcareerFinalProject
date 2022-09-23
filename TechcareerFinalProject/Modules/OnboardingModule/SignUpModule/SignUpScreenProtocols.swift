//
//  SignUpScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 23.09.2022.
//

import Foundation

protocol ViewToPresenterSignUpScreenProtocol {
    
    var interactor: PresenterToInteractorSignUpScreenProtocol? { get set }
    func signUp(email: String, password: String, completition: @escaping (Bool)->())
}

protocol PresenterToInteractorSignUpScreenProtocol {
    func signUp(email: String, password: String, completition: @escaping (Bool)->())

}

protocol PresenterToRouterSignUpScreenProtocol {
    
    static func createModule(ref: SignUpViewController)
}
