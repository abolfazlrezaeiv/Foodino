//
//  ExploreDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/1/1402 AP.
//

import Foundation

struct ExploreDataManager {
    private func loadData() -> [[String: String]] {
       let decoder = PropertyListDecoder()
       if let path = Bundle.main.path(forResource:
       "ExploreData", ofType: "plist"),
       let exploreData = FileManager.default.contents(
       atPath: path),
       let exploreItems = try? decoder.decode([[String:
       String]].self, from: exploreData) {
          return exploreItems
       }
       return [[:]]
    }
}
