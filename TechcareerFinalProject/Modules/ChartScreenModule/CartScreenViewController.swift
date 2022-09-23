//
//  CartScreenViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import UIKit
import FirebaseAuth

class CartScreenViewController: UIViewController {

    @IBOutlet weak var labelTotalPrice: UILabel!
    
    @IBOutlet weak var cartItemsTableView: UITableView!
    var presenter: ViewToPresenterCartScreenProtocol?
    
    var cartFoodList: [CartFood] = [CartFood]()
    var totalPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cart"
        self.navigationItem.backBarButtonItem?.title = ""
        labelTotalPrice.text = "\(totalPrice)"

        cartItemsTableView.delegate = self
        cartItemsTableView.dataSource = self
        CartScreenRouter.createModule(ref: self )
        presenter?.getAllCartItems()
        
    }
    
    func calculateTotalPrice() {
        totalPrice = 0
        for food in cartFoodList {
            totalPrice = totalPrice + (Int(food.yemek_fiyat!)! * Int(food.yemek_siparis_adet!)!)
        }
        labelTotalPrice.text = Utils.formatPrice(price: String(totalPrice))
    }

}

extension CartScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cartItemsTableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as! CartItemTableViewCell
        
        let food = cartFoodList[indexPath.row]
        cell.indexPath = indexPath
        cell.fetchData(food: food)
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let food = self.cartFoodList[indexPath.row]

            let alert = UIAlertController(title: "Delete", message: "\(food.yemek_adi!) will delete?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                
                let username = Auth.auth().currentUser!.email
                self.presenter?.deleteFood(foodId: food.sepet_yemek_id!, username: username!)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension CartScreenViewController: PresenterToViewCartScreenProtocol {
    func sendCartItemsToView(foods: [CartFood]) {
        cartFoodList = foods
        DispatchQueue.main.async {
            self.calculateTotalPrice()
            self.cartItemsTableView.reloadData()

        }
    }
    
    

}

extension CartScreenViewController: CellDelegate {
    func increaseFoodCount(indexPath: IndexPath) {
        presenter?.increaseFoodCount(food: cartFoodList[indexPath.row])
    }
    
    func decreaseFoodCount(indexPath: IndexPath) {
        presenter?.decreaseFoodCount(food: cartFoodList[indexPath.row])
    }
    
    
}
