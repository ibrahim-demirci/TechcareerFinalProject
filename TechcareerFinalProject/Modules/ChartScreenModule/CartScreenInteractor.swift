//
//  CartScreenInteractor.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation
import Alamofire
import FirebaseAuth

class CartScreenInteractor: PresenterToInteractorCartScreenProtocol {
    
    var presenter: InteractorToPresenterCartScreenProtocol?
    
    func getAllCartItems() {
        
        let username = Auth.auth().currentUser!.email

        let params: Parameters = [
            ParameterTags.username.tag: username!
        ]
        
        let endpointURL = Endpoints.foodsInCart.url
        AF.request(endpointURL, method: .post, parameters: params).response { response in
            
            if let data = response.data {
                do {
                    let foodsResponse = try JSONDecoder().decode(CartResponse.self, from: data)
                    
                    if let cartFoodList = foodsResponse.sepet_yemekler {
                        
                        self.presenter?.sendCartItemsToPresenter(foods: cartFoodList.sorted(by: { $0.yemek_adi! > $1.yemek_adi! }))
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    self.presenter?.sendCartItemsToPresenter(foods: [])
                }
            }
        }
    }
    
    func deleteFood(foodId: String, username: String, deleteFinished: @escaping () -> ()) {
        
        let params: Parameters = [
            ParameterTags.foodCartId.tag: foodId,
            ParameterTags.username.tag: username
        ]
        let endpointURL = Endpoints.deleteFoodInCart.url
        
        AF.request(endpointURL, method: .post, parameters: params).response { response in
            
            if let data =  response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    deleteFinished()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func increaseFoodCount(food: CartFood) {
        deleteFood(foodId: food.sepet_yemek_id!, username: food.kullanici_adi!) {
            
            let newCount = Int(food.yemek_siparis_adet!)! + 1
            let addFoodRequestParams: Parameters = [
                ParameterTags.foodName.tag:food.yemek_adi!,
                ParameterTags.foodImageName.tag:food.yemek_resim_adi!,
                ParameterTags.foodPrice.tag: food.yemek_fiyat! , ParameterTags.foodCount.tag: String(newCount),
                ParameterTags.username.tag: food.kullanici_adi!
            ]

            AF.request(Endpoints.addToCart.url, method: .post,parameters: addFoodRequestParams).response { response in

                if let data =  response.data {
                    do{
                        let cevap = try JSONSerialization.jsonObject(with: data)
                        print(cevap)
                        self.getAllCartItems()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func decreaseFoodCount(food: CartFood) {
        deleteFood(foodId: food.sepet_yemek_id!, username: food.kullanici_adi!) {
            
            let newCount = Int(food.yemek_siparis_adet!)! - 1
            let addFoodRequestParams: Parameters = [
                ParameterTags.foodName.tag:food.yemek_adi!,
                ParameterTags.foodImageName.tag:food.yemek_resim_adi!,
                ParameterTags.foodPrice.tag: food.yemek_fiyat! , ParameterTags.foodCount.tag: String(newCount),
                ParameterTags.username.tag: food.kullanici_adi!
            ]

            AF.request(Endpoints.addToCart.url, method: .post,parameters: addFoodRequestParams).response { response in

                if let data =  response.data {
                    do{
                        let cevap = try JSONSerialization.jsonObject(with: data)
                        print(cevap)
                        self.getAllCartItems()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

    
}
