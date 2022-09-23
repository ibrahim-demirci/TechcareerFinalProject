//
//  DetailScreenViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 17.09.2022.
//

import UIKit
import Alamofire
import FirebaseAuth

class DetailScreenViewController: UIViewController {

    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    
    var food: Food?
    var count: Int? {
        didSet {
            if count == 1 {
                decreaseButton.isEnabled = false
            } else {
                decreaseButton.isEnabled = true
            }
            countLabel.text = "\(count!)"
        }
    }
    
    var presenter: ViewToPresenterDetailScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        DetailScreenRouter.createModule(ref: self)
    }
    
    
    func setViews() {
        
        // Navbar
        self.title = "Food Detail"
        
        
        count = 1
        countLabel.text = "\(count!)"
        
        // Food Items
        if let food = food, let foodName = food.yemek_adi, let foodPrice =  food.yemek_fiyat, let foodImage = food.yemek_resim_adi {

            self.foodName.text = foodName
            self.foodPrice.text = Utils.formatPrice(price: foodPrice)
            
            let imageURL = Endpoints.photoWith(foodImage).url
            foodImageView.kf.setImage(with: imageURL)
        }
        
        // Buttons
        increaseButton.giveElevation()
        decreaseButton.giveElevation()
    }
    
    
    @IBAction func addToCartbutton(_ sender: Any) {
                
        let username = Auth.auth().currentUser!.email

        if let food = food {
            presenter?.addFoodToCart(food: food, count: count!, username: username!)
        }
    }
    
    
    @IBAction func decreaseButton(_ sender: Any) {
        count! -= 1
    }
    
    @IBAction func increaseButton(_ sender: Any) {
        count! += 1
    }
}
