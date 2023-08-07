//
//  LocationViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 5/4/1402 AP.
//

import UIKit

class LocationViewController: UIViewController {
    let manager = LocationDataManager()
    
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: Private Extension
private extension LocationViewController {
    func initialize() {
        manager.fetchData()
    }
}

// MARK: UITableViewDataSource
extension LocationViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfLocationItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath.row)
        return cell
    }
}
