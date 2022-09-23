//
//  PresenterManager.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 22.09.2022.
//


import Foundation
import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    private init() {}
    
    enum VC {
        case mainFeedController
        case signInViewController
    }
    
    func show(vc: VC) {
        var viewController: UIViewController
        
        switch vc {
        case .mainFeedController:
            viewController = UIStoryboard(name: StoryboardID.main.id, bundle: nil).instantiateViewController(withIdentifier: StoryboardID.mainFeedController.id)
        case .signInViewController:
            viewController = UIStoryboard(name: StoryboardID.main.id, bundle: nil).instantiateViewController(withIdentifier: StoryboardID.signInViewController.id)
        }
        
        if let sceneDeleagate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                let window = sceneDeleagate.window {
                window.rootViewController = viewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
    
