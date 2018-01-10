//
//  FeedController.swift
//  Bikes
//
//  Created by Admin on 1/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum Category: Int {
    case all = 0
    case mountain
    case hybrid
    case road
    case kids
}

let categories = ["mountain-bikes", "kids-bikes", "hybrid-bikes", "road-bikes"]

class FeedController {
    func getBikesFeed(for category: String?, with completion: @escaping([Bike]?) -> ()) {
        
        var urlString = "https://www.rei.com/rest/search/results?q=bikes&page=1&ir=q:bikes&sx=g2NNeBSFGsRmop8Y0pR8Jw==&pagesize=30"
        
        if let category = category, categories.contains(category) {
            urlString.append("&r=category:\(category)")
        }
        
        guard let feedUrl = URL(string: urlString) else { return }
        NetworkController().getNetworkResponse(url: feedUrl) { (jsonObject) in
            if let jsonObject = jsonObject {
                let results = jsonObject["results"] as! [[String: Any]]
                var bikes = [Bike]()
                for result in results {
                    let bike = Bike.init(json: result)
                    bikes.append(bike)
                    print(bikes)
                }
                completion(bikes)
            } else {
                completion(nil)
            }
        }
    }
    
    func categoryNameAtIndex(_ index: Int) -> String {
        let category = Category(rawValue: index) ?? .all
        switch category {
        case .mountain:
            return "mountain-bikes"
        case .hybrid:
            return "hybrid-bikes"
        case .road:
            return "road-bikes"
        case .kids:
            return "kids-bikes"
        default:
            return ""
        }
    }
}

