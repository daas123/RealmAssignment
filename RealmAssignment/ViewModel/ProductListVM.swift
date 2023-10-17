//
//  ProductListVm.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import Foundation
class ProductListVm{
    let services = ServicesProductDetials()
    var ProductData : ProductListModel?
    func getProductList(complition:@escaping (String)->Void){
        services.getProductList{
            dataRecived in
            guard dataRecived?.status == 200 else{
                complition("Data fecthing failed")
                return
            }
            self.ProductData = dataRecived
            complition("")
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
