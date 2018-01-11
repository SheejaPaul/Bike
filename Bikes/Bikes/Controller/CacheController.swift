//
//  CacheController.swift
//  Bikes
//
//  Created by Admin on 1/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class CacheController {
    
    // Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("bikes")
    
    // Save favorites to the cache.
    static func saveFavorites(_ favorites: [Bike]){
        // Archive the favorites into data and save it to file path
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(favorites, toFile: CacheController.ArchiveURL.path)
        if isSuccessfulSave {
            print("Bikes successfully saved.")
        } else {
            print("Failed to save meals")
        }
    }
    
    // Load the favorites list form cache
    
    static func loadFavorites() -> [Bike]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: CacheController.ArchiveURL.path) as? [Bike])
    }
}













