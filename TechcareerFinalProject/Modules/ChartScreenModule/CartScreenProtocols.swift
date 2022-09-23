//
//  CartScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation


protocol ViewToPresenterCartScreenProtocol {
    
    var interactor: PresenterToInteractorCartScreenProtocol? { get set }
    var view: PresenterToViewCartScreenProtocol? { get set }
    
    func getAllCartItems()
    func deleteFood(foodId: String, username: String)
    func increaseFoodCount(food: CartFood)
    func decreaseFoodCount(food: CartFood)

}


protocol PresenterToInteractorCartScreenProtocol {
    
    var presenter: InteractorToPresenterCartScreenProtocol? { get set }

    func getAllCartItems()
    func deleteFood(foodId: String, username: String, deleteFinished: @escaping ()->())
    func increaseFoodCount(food: CartFood)
    func decreaseFoodCount(food: CartFood)


}

protocol InteractorToPresenterCartScreenProtocol {
    
    func sendCartItemsToPresenter(foods: [CartFood])
}


protocol PresenterToViewCartScreenProtocol {
    
    func sendCartItemsToView(foods: [CartFood])
}


protocol PresenterToRouterCartScreenProtocol {
    
    static func createModule(ref: CartScreenViewController)
}
