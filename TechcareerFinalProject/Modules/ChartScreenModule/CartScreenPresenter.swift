//
//  CartScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation

class CartScreenPresenter: ViewToPresenterCartScreenProtocol {
    
    
    
    var interactor: PresenterToInteractorCartScreenProtocol?
    
    var view: PresenterToViewCartScreenProtocol?
    
    func getAllCartItems() {
        interactor?.getAllCartItems()
    }
    
    func deleteFood(foodId: String, username: String) {
        interactor?.deleteFood(foodId: foodId, username: username) {
            self.interactor?.getAllCartItems()

        }
    }
    
    func increaseFoodCount(food: CartFood) {
        interactor?.increaseFoodCount(food: food)
    }
    
    func decreaseFoodCount(food: CartFood) {
        interactor?.decreaseFoodCount(food: food)
    }
    
}


extension CartScreenPresenter: InteractorToPresenterCartScreenProtocol {
    func sendCartItemsToPresenter(foods: [CartFood]) {
        view?.sendCartItemsToView(foods: foods)
    }
    
    
}
