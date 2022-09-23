//
//  SignInScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 22.09.2022.
//

import Foundation


protocol ViewToPresenterSignInScreenProtocol {
    
    var interactor: PresenterToInteractorSignInScreenProtocol? { get set }
    func signIn(email: String, password: String, completition: @escaping (Bool)->())
}

protocol PresenterToInteractorSignInScreenProtocol {
    func signIn(email: String, password: String, completition: @escaping (Bool)->())

}

protocol PresenterToRouterSignInScreenProtocol {
    
    static func createModule(ref: SignInViewController)
}
