//
//  productListCell.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import UIKit

class productListCell: UITableViewCell {

    var productId : Int?
    var viewmodel = ProductListVm()
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var prize: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnLike.setImage(UIImage(systemName: "heart" ), for: .normal)
        btnLike.setImage(UIImage(systemName: "heart.fill" ), for: .selected)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setLikeBtnState(){
        let data = ProductFav(productId: productId ?? 0, isFav: btnLike.isSelected)
        if viewmodel.setStateOfBtn(data: data){
            btnLike.isSelected = true
        }else{
            btnLike.isSelected = false
        }
    }
    
    func sendToDatabase(){
        let data = ProductFav(productId: productId ?? 0, isFav: btnLike.isSelected)
        if viewmodel.fetchDataForID(data: data){
            viewmodel.editDataTODataBase(data: data, isFav: btnLike.isSelected)
        }else{
            viewmodel.addDataToDataBase(data: data)
        }
    }
    
    @IBAction func onLikeClick(_ sender: UIButton) {
        if btnLike.isSelected{
            btnLike.isSelected = false
            sendToDatabase()
            
        }else{
            btnLike.isSelected = true
            sendToDatabase()
        }
    }
}
