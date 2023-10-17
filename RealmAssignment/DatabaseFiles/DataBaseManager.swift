//
//  DataBaseManager.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import UIKit
import RealmSwift
class DataBasemanager{
    static let shared = DataBasemanager()
    private var realm = try! Realm()
    
    func getDatabaseurl() -> URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    func saveContacts(data : ProductFav){
        try! realm.write{
            realm.add(data)
        }
    }
    func editData(data : ProductFav , isFav : Bool){
        if let productToEdit = realm.object(ofType: ProductFav.self, forPrimaryKey: data.productId) {
                try! realm.write {
                    productToEdit.isFav = isFav
                }
            }
    }
    
    func fetchDataId(data : ProductFav)  -> Bool{
        if (realm.object(ofType: ProductFav.self, forPrimaryKey: data.productId) != nil){
                return true
            } else {
                return false
            }
    }
    
    func setStateOfBtn(data : ProductFav)  -> Bool{
        if let data = realm.object(ofType: ProductFav.self, forPrimaryKey: data.productId){
            if data.isFav{
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
    
}
