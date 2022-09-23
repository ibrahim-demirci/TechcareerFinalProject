//
//  FoodsResponse.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 17.09.2022.
//

import Foundation


struct FoodsResponse: Codable {
    
    let yemekler: [Food]?
    let success: Int?
}
