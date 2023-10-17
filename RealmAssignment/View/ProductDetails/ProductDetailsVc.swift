//
//  ProductDetailsVc.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import UIKit
import SDWebImage
class ProductDetailsVc: UIViewController {

    var deligate : Reload?
    let viewmodel = ProductDetailsVm()
    var productid : Int?
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProducer: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFav.setImage(UIImage(systemName: "heart"), for: .normal)
        btnFav.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        getData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deligate?.reloadData()
    }
    
    func fillData(){
        let data = viewmodel.ProductData?.data
        lblTitle.text = data?.name
        lblCost.text = String(data?.cost ?? 0)
        lblRating.text = "Rating " + "\(String(data?.rating ?? 0))"
        lblProducer.text = data?.producer
        lblDescription.text = data?.description
        if let imageUrl = URL(string: data?.product_images?.first?.image ?? "invalid"){
            imgView.sd_setImage(with: imageUrl)
        }else{
            imgView.image = UIImage(systemName:"lock")
        }
        let setbtnState = ProductFav(productId: productid, isFav: btnFav.isSelected)
        btnFav.isSelected = viewmodel.setStateOfBtn(data: setbtnState)
    }
    
    func getData(){
        viewmodel.getProductDetails(id: productid ?? 0){
            res in
            DispatchQueue.main.async {
                if res.isEmpty{
                    self.fillData()
                    print("data retrived succefull")
                }else{
                    print("error")
                }
            }
        }
    }
    
    func sendToDatabase(){
        let data = ProductFav(productId: productid ?? 0, isFav: btnFav.isSelected)
        if viewmodel.fetchDataForID(data: data){
            viewmodel.editDataTODataBase(data: data, isFav: btnFav.isSelected)
        }else{
            viewmodel.addDataToDataBase(data: data)
        }
    }
    
    @IBAction func onFavBtn(_ sender: UIButton) {
        if btnFav.isSelected{
            btnFav.isSelected = false
            sendToDatabase()
        }else{
            btnFav.isSelected = true
            sendToDatabase()
        }
    }
}
