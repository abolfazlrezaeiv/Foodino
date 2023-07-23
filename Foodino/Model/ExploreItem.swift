//
//  ExploreItem.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/1/1402 AP.
//

import Foundation


struct ExploreItem {
    let name : String?
    let image : String?
}


extension ExploreItem {
    init(dict: [String : String]) {
        self.name = dict["name"]
        self.image = dict["image"]
    }
}
