//
//  FeedScreenProtocols.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

protocol ViewToPresenterFeedScreenProtocol {
    
    var interactor: PresenterToInteractorFeedScreenProtocol? { get set }
    var view: PresenterToViewFeedScreenProtocol? { get set }
    
    func getAllFoods()
    func searchFood(searchText: String)
}


protocol PresenterToInteractorFeedScreenProtocol {
    
    var presenter: InteractorToPresenterFeedScreenProtocol? { get set }

    func getAllFoods()
    func searchFood(searchText: String)

}

protocol InteractorToPresenterFeedScreenProtocol {
    
    func sendAllFoodsToPresenter(foods: [Food])
}


protocol PresenterToViewFeedScreenProtocol {
    
    func sendAllFoodsToView(foods: [Food])
}


protocol PresenterToRouterFeedScreenProtocol {
    
    static func createModule(ref: FeedScreenViewController)
}
