//
//  RestaurantDetailViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/8/1402 AP.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    var selectedRestaurant : RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)

    }
}
