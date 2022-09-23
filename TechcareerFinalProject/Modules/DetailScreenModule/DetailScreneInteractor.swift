//
//  DetailScreneInteractor.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation
import Alamofire
import CoreImage

class DetailScreenInteractor: PresenterToInteractorDetailScreenProtocol {

    var cartFoodList = [CartFood]()
    
    func addFoodToCart(food: Food, count: Int, username: String) {
        var sameFood: CartFood?
        
        // get chart foods
        getCartFoods(username: username) {
            
            // control food is exist
            sameFood =  self.foodIsExists(food: food)
            
            // update exists food count
            if sameFood != nil {
                let oldCount = sameFood!.yemek_siparis_adet!
                let addCount = count
                sameFood!.yemek_siparis_adet = String(Int(oldCount)! + addCount)
                
                self.deleteFood(foodId: sameFood!.sepet_yemek_id!, username: sameFood!.kullanici_adi!) {
                                    
                    let newFood = Food(yemek_id: nil, yemek_adi: sameFood?.yemek_adi, yemek_resim_adi: sameFood?.yemek_resim_adi, yemek_fiyat: sameFood?.yemek_fiyat)
                    
                    self.addNewFoodToCart(food: newFood, count: Int(sameFood!.yemek_siparis_adet!)!, username: sameFood!.kullanici_adi!)
                }
                
            } else {
                
                self.addNewFoodToCart(food: food, count: count, username: username)
            }
        }
    }
    
    private func addNewFoodToCart(food: Food, count: Int, username: String) {

        let addFoodRequestParams: Parameters = [
            ParameterTags.foodName.tag:food.yemek_adi!,
            ParameterTags.foodImageName.tag:food.yemek_resim_adi!,
            ParameterTags.foodPrice.tag: food.yemek_fiyat! , ParameterTags.foodCount.tag: count,
            ParameterTags.username.tag: username
        ]

        AF.request(Endpoints.addToCart.url, method: .post,parameters: addFoodRequestParams).response { response in

            if let data =  response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteFood(foodId: String, username: String, deleteFinished: @escaping () -> Void) {
        
        let params: Parameters = [
            ParameterTags.foodCartId.tag: foodId,
            ParameterTags.username.tag: username
        ]
        
        let endpointURL = Endpoints.deleteFoodInCart.url
        
        AF.request(endpointURL, method: .post, parameters: params).response { response in
            
            if let data =  response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    deleteFinished()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getCartFoods(username: String, completion: @escaping () -> Void) {
        
        let params: Parameters = [ParameterTags.username.tag: username]
        
        let endpointURL = Endpoints.foodsInCart.url
        
        AF.request(endpointURL, method: .post, parameters: params).response { response in
            
            print(response)
            if let data = response.data {
                do {
                    let foodsResponse = try JSONDecoder().decode(CartResponse.self, from: data)
                    print(foodsResponse)
                    if let cartFoods = foodsResponse.sepet_yemekler {
                        self.cartFoodList = cartFoods
                        completion()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    completion()
                }
            }
        }
    }
    
    func foodIsExists(food: Food) -> CartFood? {
        let sameFood = cartFoodList.first{ $0.yemek_adi == food.yemek_adi}
        
        if sameFood != nil {
            return sameFood!
        }
        
        return nil
    }
    
}
