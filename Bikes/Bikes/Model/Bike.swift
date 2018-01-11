//
//  Bike.swift
//  Bikes
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class PriceDisplay: NSObject, NSCoding {
    var price: String
    
    override init() {
        self.price = ""
        super.init()
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        self.price = json["price"] as? String ?? "Not Available"
    }
    
    // MARK:- NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self.price = aDecoder.decodeObject(forKey: "price") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.price, forKey: "price")
    }
}

class DisplayPrice: NSObject, NSCoding {
    var priceDisplay: PriceDisplay
    
    override init() {
        self.priceDisplay = PriceDisplay()
        super.init()
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        if let json = json["priceDisplay"] as? [String: Any] {
            self.priceDisplay = PriceDisplay(json: json)
        } else {
            self.priceDisplay = PriceDisplay()
        }
    }
    
    // MARK:- NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self.priceDisplay = aDecoder.decodeObject(forKey: "priceDisplay") as! PriceDisplay
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.priceDisplay, forKey: "priceDisplay")
    }
}

class Bike: NSObject, NSCoding {
    
    var prodId: String
    var cleanTitle: String
    var thumbnailImageLink: String
    var brand: String
    var benefit: String
    var rating: Float
    var reviewCount: Int
    var displayPrice: DisplayPrice

    override init() {
        self.prodId = ""
        self.cleanTitle = ""
        self.thumbnailImageLink = ""
        self.brand = ""
        self.benefit = ""
        self.rating = 0.0
        self.reviewCount = 0
        self.displayPrice = DisplayPrice()
        super.init()
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        self.prodId = json["prodId"] as? String ?? ""
        self.cleanTitle = json["cleanTitle"] as? String ?? ""
        self.thumbnailImageLink = json["thumbnailImageLink"] as? String ?? ""
        self.brand = json["brand"] as? String ?? ""
        self.benefit = json["benefit"] as? String ?? ""
        self.rating = Float(json["rating"] as? String ?? "") ?? 0
        self.reviewCount = Int(json["reviewCount"] as? String ?? "") ?? 0
        if let json = json["displayPrice"] as? [String: Any] {
            self.displayPrice = DisplayPrice(json: json)
        } else {
            self.displayPrice = DisplayPrice()
        }
    }
    
    // MARK:- NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self.prodId = aDecoder.decodeObject(forKey: "prodId") as! String
        self.cleanTitle = aDecoder.decodeObject(forKey: "cleanTitle") as! String
        self.thumbnailImageLink = aDecoder.decodeObject(forKey: "thumbnailImageLink") as! String
        self.brand = aDecoder.decodeObject(forKey: "brand") as! String
        self.benefit = aDecoder.decodeObject(forKey: "benefit") as! String
        self.rating = aDecoder.decodeFloat(forKey: "rating") as! Float
        self.reviewCount = aDecoder.decodeInteger(forKey: "reviewCount") as! Int
        self.displayPrice = aDecoder.decodeObject(forKey: "displayPrice") as! DisplayPrice
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.prodId, forKey: "prodId")
        aCoder.encode(self.cleanTitle, forKey: "cleanTitle")
        aCoder.encode(self.thumbnailImageLink, forKey: "thumbnailImageLink")
        aCoder.encode(self.brand, forKey: "brand")
        aCoder.encode(self.benefit, forKey: "benefit")
        aCoder.encode(self.rating, forKey: "rating")
        aCoder.encode(self.reviewCount, forKey: "reviewCount")
        aCoder.encode(self.displayPrice, forKey: "displayPrice")
    }
}























