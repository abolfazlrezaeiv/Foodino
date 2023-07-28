//
//  LocationViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/4/1402 AP.
//

import UIKit

class LocationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let manager = LocationDataManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfLocationItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath.row)
        return cell
    }
    

    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.fetchData()
    }
}
