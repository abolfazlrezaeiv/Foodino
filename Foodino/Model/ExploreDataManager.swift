//
//  ExploreDataManager.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/1/1402 AP.
//

import Foundation

struct ExploreDataManager : DataManager {
    private var exploreItems : [ExploreItem] = []
    
    mutating func fetch()  {
        for data in loadPlist(file: "ExploreData") {
            exploreItems.append(ExploreItem(dict: data as! [String:String]))
        }
    }
    
  
    
    func numberOfExploreItems() -> Int {
        exploreItems.count
    }
    
    func exploreItem(at index : Int) -> ExploreItem {
        exploreItems[index]
    }
}
