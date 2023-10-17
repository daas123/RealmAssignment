//
//  ProductListModel.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import Foundation
import RealmSwift
struct ProductListModel : Codable{
    var status : Int
    var data : [ProductData]?
}

struct ProductData : Codable{
    var id : Int
    var product_category_id : Int
    var name : String
    var producer : String
    var description : String
    var cost : Int
    var rating : Int
    var modified : String
    var created : String
    var view_count : Int
    var product_images : String
}

class ProductFav: Object {
    @Persisted (primaryKey: true) var productId: Int?
    @Persisted var isFav: Bool
    convenience init(productId: Int?, isFav: Bool) {
        self.init()
        self.productId = productId
        self.isFav = isFav
    }
}


