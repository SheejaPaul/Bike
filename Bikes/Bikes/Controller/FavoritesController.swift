//
//  FavoritesController.swift
//  Bikes
//
//  Created by Admin on 1/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class FavoritesController {
    
    static func allFavorites() -> [Bike]? {
        return CacheController.loadFavorites()
    }
    
    static func isFavorite(_ bike: Bike) -> Bool {
        if let favorites = CacheController.loadFavorites() {
            return favorites.contains(where: { $0.prodId == bike.prodId})
        } else {
            return false
        }
    }
    
    static func markFavorite(_ bike: Bike) {
        var favorites = [Bike]()
        if let cachedFavorites = CacheController.loadFavorites() {
            favorites = cachedFavorites
        }
        favorites.append(bike)
        CacheController.saveFavorites(favorites)
    }
    
    static func unmarkFavorite(_ bike: Bike) {
        if isFavorite(bike) {
            var favorites = [Bike]()
            if let cachedFavorites = CacheController.loadFavorites() {
                favorites = cachedFavorites
            }
            if let index = favorites.index(where: { $0.prodId == bike.prodId }) {
                favorites.remove(at: index)
                CacheController.saveFavorites(favorites)
            }
        }
    }
}









