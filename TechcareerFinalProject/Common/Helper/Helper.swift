//
//  Helper.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 22.09.2022.
//

import Foundation


func delay(durationSeconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + durationSeconds, execute: completion)
}
