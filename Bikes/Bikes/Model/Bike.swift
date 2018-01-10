//
//  Bike.swift
//  Bikes
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Bike {
    var cleanTitle: String
    var thumbnailImageLink: String
    var brand: String
    var benefit: String
    var rating: Float
    var reviewCount: Int
    //var price: String
    var displayPrice: DisplayPrice
    
    init(json: [String: Any]) {
        self.cleanTitle = json["cleanTitle"] as? String ?? ""
        self.thumbnailImageLink = json["thumbnailImageLink"] as? String ?? ""
        self.brand = json["brand"] as? String ?? ""
        self.benefit = json["benefit"] as? String ?? ""
        self.rating = Float(json["rating"] as? String ?? "") ?? 0
        self.reviewCount = Int(json["reviewCount"] as? String ?? "") ?? 0
        self.displayPrice = DisplayPrice(json: json["displayPrice"] as? [String: Any] ?? [String: Any]())
    }
    
    
}

struct DisplayPrice {
    var priceDisplay: PriceDisplay
    
    init(json: [String: Any]) {
        self.priceDisplay = PriceDisplay(json: json["priceDisplay"] as? [String: Any] ?? [String: Any]())
    }
}

struct PriceDisplay {
    var price: String
    
    init(json: [String: Any]) {
        self.price = json["price"] as? String ?? ""
    }
}
