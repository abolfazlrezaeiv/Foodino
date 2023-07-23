import UIKit
import PlaygroundSupport


class CollectionViewExampleController : UIViewController , UICollectionViewDataSource {
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.view.bounds = CGRect(x: 0, y: 0, width: 200   , height: 300)
        createCollectionView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView:
    UICollectionView, cellForItemAt indexPath:
    IndexPath) -> UICollectionViewCell{
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxCell", for: indexPath)
        cell.backgroundColor = .red
       return cell
    }
    

    func createCollectionView()  {
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height),collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = .blue
        self.collectionView?.register(UICollectionViewCell.self,forCellWithReuseIdentifier: "BoxCell")
        self.view.addSubview(self.collectionView!)
    }
    
    var collectionView: UICollectionView?
    
   
}

PlaygroundPage.current.liveView = CollectionViewExampleController()



