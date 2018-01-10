//
//  FeedController.swift
//  Bikes
//
//  Created by Admin on 1/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class FeedController {
    func getBikesFeed(_ completion: @escaping([Bike]?) -> ()) {
        
        let urlString = "https://www.rei.com/rest/search/results?version=g2&ir=category%3Acycle&origin=web&r=category%3Acycling&page=1&sx=7XZJTTUoM5GICWMFt%2FOmYw%3D%3D&pagesize=90"
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
}

