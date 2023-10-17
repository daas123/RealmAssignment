//
//  ProductVc.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import UIKit
import SDWebImage
class ProductListVc: UIViewController {
    @IBOutlet weak var tblViewProductList: UITableView!
    let viewmodel = ProductListVm()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewProductList.delegate = self
        tblViewProductList.dataSource = self
        title = "Tables"
        getData()
    }
    
    func getData(){
        viewmodel.getProductList{
            res in
            DispatchQueue.main.async {
                if res.isEmpty{
                    self.tblViewProductList.reloadData()
                }else{
                    print("error")
                }

            }
        }
    }
}
extension ProductListVc : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.ProductData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! productListCell
        let data = viewmodel.ProductData?.data
        cell.title.text = data?[indexPath.row].name
        cell.prize.text = String(data?[indexPath.row].cost ?? 0)
        cell.producer.text = data?[indexPath.row].producer
        cell.productId = data?[indexPath.row].id
        cell.setLikeBtnState()
        if let imageUrl = URL(string:data?[indexPath.row].product_images ?? "invalid"){
            cell.imageview.sd_setImage(with: imageUrl)
        }else{
            cell.imageview.image = UIImage(systemName:"lock")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
