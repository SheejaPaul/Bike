//
//  NetworkController.swift
//  Bikes
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    // get JSON data
    func getNetworkResponse(url: URL?, completion: @escaping([String: Any]?) -> ()) {
        guard let feedUrl = url else { return }
        let task = URLSession.shared.dataTask(with: feedUrl) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                print("HTTP URL Response Code: ", code)
            }
            guard let data = data else { return }
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments), let jsonObject = json as? [String: Any] {
                completion(jsonObject)
            } else {
                guard let error = error else { return }
                print("Error: ", error)
                completion(nil)
            }
        }
        task.resume()
    }
    
    // get Image from URL
    func getImageFromURL(url: URL?, completion: @escaping(UIImage?) -> ()) {
        guard let imageUrl = url else { return }
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}


