//
//  File.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import Foundation


struct CartResponse: Codable {
    
    let sepet_yemekler: [CartFood]?
    let success: Int?
}
