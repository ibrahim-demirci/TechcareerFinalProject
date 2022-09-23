//
//  FeedScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

class FeedScreenPresenter: ViewToPresenterFeedScreenProtocol {
    
    
    
    var interactor: PresenterToInteractorFeedScreenProtocol?
    var view: PresenterToViewFeedScreenProtocol?

    
    func getAllFoods() {
        interactor?.getAllFoods()
    }
    
    func searchFood(searchText: String) {
        interactor?.searchFood(searchText: searchText)
    }

    
    
}

extension FeedScreenPresenter: InteractorToPresenterFeedScreenProtocol {
    func sendAllFoodsToPresenter(foods: [Food]) {
        view?.sendAllFoodsToView(foods: foods)
    }
}
