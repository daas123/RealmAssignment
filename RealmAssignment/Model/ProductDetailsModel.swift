//
//  ProductDetailsModel.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import Foundation
enum apiEndPoints:String{
    case apiUrlForList = "http://staging.php-dev.in:8844/trainingapp/api/products/getList"
    case apiUrlForDetails = "http://staging.php-dev.in:8844/trainingapp/api/products/getDetail"
}

struct productDetails : Codable {
    let status : Int
    let data : Details?
}

struct Details : Codable {
    let id : Int?
    let product_category_id : Int?
    let name : String?
    let producer : String?
    let description : String?
    let cost : Int?
    let rating : Int?
    let view_count : Int?
    let created : String?
    let modified : String?
    let product_images : [Product_images]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case product_category_id = "product_category_id"
        case name = "name"
        case producer = "producer"
        case description = "description"
        case cost = "cost"
        case rating = "rating"
        case view_count = "view_count"
        case created = "created"
        case modified = "modified"
        case product_images = "product_images"
    }
}

struct Product_images:Codable{
    let id : Int?
    let product_id : Int?
    let image : String?
    let created : String
    let modified : String
}


