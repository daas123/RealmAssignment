//
//  ServicesProductDetials.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import Foundation
class ServicesProductDetials{
    func getProductList(complition: @escaping (ProductListModel?)->Void){
        let url = URL(string : "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1&page=1" )
        let task = URLSession.shared.dataTask(with: url!) { prodData, responce, error in
            
            guard error == nil else{
                return
            }
            
            guard (responce as! HTTPURLResponse).statusCode == 200 else{
                return
            }
            
            guard let data = prodData else{
                return
            }
            
            do {
                let responseData = try? JSONDecoder().decode(ProductListModel.self, from: data)
                complition(responseData)
            }
            
        }
    
        task.resume()
    }
    
}
