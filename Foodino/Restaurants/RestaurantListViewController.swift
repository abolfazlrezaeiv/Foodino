//
//  RestaurantListViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 4/29/1402 AP.
//

import UIKit

class RestaurantListViewController: UIViewController {

    @IBOutlet var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}



extension RestaurantListViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resturantCell", for: indexPath)
        return cell
        
    }
    
    
}
