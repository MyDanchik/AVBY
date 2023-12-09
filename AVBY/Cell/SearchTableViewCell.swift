import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var conteinerView: UIView!
        
    @IBOutlet weak var nameCarLabel: UILabel!
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var priceCarLabel: UILabel!
    
    @IBOutlet weak var dpriceCarLabel: UILabel!
    
    @IBOutlet weak var infoCarLabel: UILabel!
    
    @IBOutlet weak var locationCarLabel: UILabel!
    
    private var photos = [UIImage]()
    func configure(photos: [UIImage]) {
        self.photos = photos
        self.photoCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conteinerView.layer.cornerRadius = 10
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
        selectionStyle = .none
    }

    
}


extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            return iconCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
}
