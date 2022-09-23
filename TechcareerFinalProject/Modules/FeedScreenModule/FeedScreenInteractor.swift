//
//  FeedScreenInteractor.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import Foundation
import Alamofire
import FirebaseAuth

class FeedScreenInteractor: PresenterToInteractorFeedScreenProtocol {
    
    var presenter: InteractorToPresenterFeedScreenProtocol?
    
    func getAllFoods() {
        
        AF.request(Endpoints.allFoods.url, method: .get).response { response in
            
            if let data = response.data {
                do {
                    let foodsResponse = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    
                    if let foodList = foodsResponse.yemekler {
                        self.presenter?.sendAllFoodsToPresenter(foods: foodList)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchFood(searchText: String) {
        
        
        AF.request(Endpoints.allFoods.url, method: .get).response { response in
            
            if let data = response.data {
                do {
                    let foodsResponse = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    
                    if let foodList = foodsResponse.yemekler {
                        var searchedFoodList = [Food]()
                        for food in foodList {
                            
                            if food.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                                searchedFoodList.append(food)
                            }
                        }
                        self.presenter?.sendAllFoodsToPresenter(foods: searchedFoodList)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    

}
