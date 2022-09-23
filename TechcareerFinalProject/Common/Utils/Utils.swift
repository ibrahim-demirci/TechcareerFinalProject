//
//  Utils.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 17.09.2022.
//

import Foundation
import CoreText

class Utils {
    
    
    static func formatPrice(price: String) -> String{
        
        let formattedPrice = "₺\(price),99"
        return formattedPrice
    }

}

enum Endpoints {
    
    private var baseURL: String {
        return "http://kasimadalan.pe.hu/yemekler"
        
    }
    
    case allFoods
    case photoWith(String)
    case addToCart
    case foodsInCart
    case deleteFoodInCart
    
    private var fullPath: String {
        var endpoint:String
        
        
        switch self {
            case .allFoods:
                endpoint = "/tumYemekleriGetir.php"
            case .photoWith(let foodImageName):
                endpoint = "/resimler/\(foodImageName)"
            case .addToCart:
                endpoint = "/sepeteYemekEkle.php"
            case .foodsInCart:
                endpoint = "/sepettekiYemekleriGetir.php"
            case .deleteFoodInCart:
                endpoint = "/sepettenYemekSil.php"
        }
        
        return baseURL + endpoint
    }
    
    var url: URL {
            guard let url = URL(string: fullPath) else {
                preconditionFailure("The url used in \(Endpoints.self) is not valid")
            }
            return url
        }
}

enum ParameterTags: String {
    
    case username
    case foodName
    case foodCount
    case foodPrice
    case foodImageName
    case foodCartId

    
    var tag: String {
        switch self {
           
        // For Food and Cart Food Common
        case .foodName: return "yemek_adi"
        case .foodPrice: return "yemek_fiyat"
        case .foodImageName: return "yemek_resim_adi"
            
            
        // For CartFood model
        case .foodCartId: return "sepet_yemek_id"
        case .username: return "kullanici_adi"
        case .foodCount: return "yemek_siparis_adet"
        
        
        }
    }
}

enum StoryboardID: String {
    
    case main
    case mainFeedController
    case signInViewController
    
    var id: String {
        
        switch self {
        case .main: return "Main"
        case .mainFeedController: return "FeedViewController"
        case .signInViewController: return "SignInViewController"
        }
    }
    
}

enum SegueID: String {
    
    case showSignInPageScreen
    case showSignUpPageScreen
    case showDetailScreen
    
    var id: String {
        
        switch self {
        case .showSignInPageScreen: return "showSignIn"
        case .showSignUpPageScreen: return "showSignUp"
        case .showDetailScreen: return "showDetail"

            
        }
    }
}
