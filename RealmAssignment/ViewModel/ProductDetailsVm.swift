//
//  ProductDetailsVm.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import Foundation
class ProductDetailsVm{
    let services = ProductListApiService()
    var ProductData : productDetails?
    func getProductDetails(id : Int,complition:@escaping (String)->Void){
        services.getproductDetails(id: id){
            dataRecived in
            switch dataRecived {
            case .success(let data):
                self.ProductData = data
                complition("")
            case .failure(let error):
                print(error.localizedDescription)
                complition("Something Went Wrong")
            }
        }
    }
    
    func addDataToDataBase(data : ProductFav){
        DataBasemanager.shared.saveContacts(data: data)
    }
    
    func editDataTODataBase(data : ProductFav , isFav : Bool){
        DataBasemanager.shared.editData(data: data, isFav: isFav )
    }
    
    func fetchDataForID(data: ProductFav) -> Bool{
        let res = DataBasemanager.shared.fetchDataId(data: data)
        return res
    }
    
    func setStateOfBtn(data: ProductFav) -> Bool{
        let res = DataBasemanager.shared.setStateOfBtn(data: data)
        return res
    }
}
