//
//  FeedScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

protocol ViewToPresenterProtocol {
    
    var interactor: PresenterToInteractorProtocol? { get set }
    
    func getAllFoods()
}


protocol PresenterToInteractorProtocol {
    
    func getAllFoods()
    
}

protocol PresenterToRouterProtocol {
    
    static func createModule(ref: FeedScreenViewController)
}
