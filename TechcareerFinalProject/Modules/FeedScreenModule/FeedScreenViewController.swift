
//
//  ViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 16.09.2022.
//

import UIKit
import Kingfisher

class FeedScreenViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var carouselImageView: UIImageView!
    
    var foodList: [Food] = [Food]()
    
    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    
    var presenter: ViewToPresenterFeedScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        FeedScreenRouter.createModule(ref: self)
        setViews()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getAllFoods()
    }
    
    func setViews() {
        setNavigationBar()
        setCollectionView()
        setCarouselImage()
    }
    
    func setNavigationBar() {
            
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    func setCarouselImage() {
        carouselImageView.layer.borderWidth = 1
        carouselImageView.layer.borderColor = UIColor(named: "mainColor")?.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueID.showDetailScreen.id {
            
            let destination = segue.destination as! DetailScreenViewController
            destination.food = sender as! Food
            
        }
    }


}

extension FeedScreenViewController: PresenterToViewFeedScreenProtocol {
    func sendAllFoodsToView(foods: [Food]) {
        foodList = foods
        feedCollectionView.reloadData()
    }
}


extension FeedScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
            
        
        let url = Endpoints.photoWith(foodList[indexPath.row].yemek_resim_adi!).url
        cell.imageview.kf.setImage(with: url)
        cell.priceLabel.text = Utils.formatPrice(price: foodList[indexPath.row].yemek_fiyat!)
        cell.nameLabel.text = foodList[indexPath.row].yemek_adi
        
        
        cell.layer.borderColor = UIColor(named: "mainLightColor")?.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10.0
               
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueID.showDetailScreen.id, sender: foodList[indexPath.row])
    }
    
    func setCollectionView() {
        
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        
        // Collection View
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        design.minimumInteritemSpacing = 20
        design.minimumLineSpacing = 20
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = (width - 80) / 2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        feedCollectionView.collectionViewLayout = design
        
    }
    
}

extension FeedScreenViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchText.isEmpty ? presenter?.getAllFoods() : presenter?.searchFood(searchText: searchText)
    }
}

extension FeedScreenViewController {
    
    func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
            self.searchBar.resignFirstResponder()

        }
}
