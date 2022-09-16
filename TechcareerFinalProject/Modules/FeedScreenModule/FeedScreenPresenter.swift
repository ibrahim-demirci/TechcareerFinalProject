//
//  FeedScreenPresenter.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation

class FeedScreenPresenter: ViewToPresenterProtocol {
    var interactor: PresenterToInteractorProtocol?
    
    func getAllFoods() {
        interactor?.getAllFoods()
    }
    
    
}
