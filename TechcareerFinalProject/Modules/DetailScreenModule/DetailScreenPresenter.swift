//
//  DetailScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation

class DetailScreenPresenter: ViewToPresenterDetailScreenProtocol {
    func addFoodToCart(food: Food, count: Int, username: String) {
        interactor?.addFoodToCart(food: food, count: count, username: username)
    }
    
    var interactor: PresenterToInteractorDetailScreenProtocol?
    
    
}
