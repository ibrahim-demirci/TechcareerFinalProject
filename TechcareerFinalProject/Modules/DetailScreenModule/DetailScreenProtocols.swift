//
//  DetailScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation

protocol ViewToPresenterDetailScreenProtocol {
    
    var interactor: PresenterToInteractorDetailScreenProtocol? { get set }
    func addFoodToCart(food: Food, count: Int, username: String)
    
}

protocol PresenterToInteractorDetailScreenProtocol {
    
    func addFoodToCart(food: Food, count: Int, username: String)

}

protocol PresenterToRouterDetailScreenProtocol {
    
    static func createModule(ref: DetailScreenViewController)
}

