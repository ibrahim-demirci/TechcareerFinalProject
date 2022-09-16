
//
//  ViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import UIKit

class FeedScreenViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedScreenRouter.createModule(ref: self)
        presenter?.getAllFoods()
    }
}

