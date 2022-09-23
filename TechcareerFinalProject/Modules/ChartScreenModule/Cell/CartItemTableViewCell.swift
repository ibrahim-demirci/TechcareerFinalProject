//
//  CartItemTableViewCell.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 18.09.2022.
//

import UIKit
import Kingfisher

protocol CellDelegate {
    func increaseFoodCount(indexPath: IndexPath)
    func decreaseFoodCount(indexPath: IndexPath)

}

class CartItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewItem: UIImageView!
    
    @IBOutlet weak var labelItemName: UILabel!
    @IBOutlet weak var labelItemPrice: UILabel!
    @IBOutlet weak var labelItemCount: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var cellDelegate: CellDelegate?
    var indexPath: IndexPath?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        minusButton.giveElevation()
        plusButton.giveElevation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func fetchData(food: CartFood) {
        
        let imageURL = Endpoints.photoWith(food.yemek_resim_adi!).url
        
        imageViewItem.kf.setImage(with: imageURL)
        labelItemName.text = food.yemek_adi
        labelItemPrice.text = Utils.formatPrice(price: food.yemek_fiyat!)
        labelItemCount.text = "\(food.yemek_siparis_adet!)"
    }
    
    
    @IBAction func increaseCount(_ sender: Any) {
        cellDelegate!.increaseFoodCount(indexPath: indexPath! )
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
        cellDelegate!.decreaseFoodCount(indexPath: indexPath! )
    }
    
}

extension UIView {

    func giveElevation() {
        
        let shadowSize : CGFloat = 3.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(named: "mainLightColor")?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowPath = shadowPath.cgPath
        

            
        }

}
