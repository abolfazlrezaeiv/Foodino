//
//  ExploreViewController.swift
//  Foodino
//
//  Created by Abolfazl-Atena on 4/27/1402 AP.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var manager = ExploreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        manager.fetch()
        
    }
    
    @IBAction func unwindToLocationCancel(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

extension ExploreViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        manager.numberOfExploreItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let exploreItem = manager.exploreItem(at: indexPath.row)
        cell.exploreNameLabel.text = exploreItem.name
        cell.exploreImageView.image = UIImage(named: exploreItem.image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        return header
    }
}
