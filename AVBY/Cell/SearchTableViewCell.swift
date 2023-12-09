import UIKit
import AVFoundation

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
        textEdit()
        if let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 3
            layout.minimumLineSpacing = 0
        }
        
        //photoCollectionView.layer.cornerRadius = 0
        
        
    }
    
    private func textEdit() {
        nameCarLabel.textColor = UIColor.black
        nameCarLabel.font =  UIFont.systemFont(ofSize: 18)
        
        priceCarLabel.textColor = UIColor.black
        priceCarLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        dpriceCarLabel.textColor = UIColor.darkGray
        dpriceCarLabel.font =  UIFont.systemFont(ofSize: 17)
        
        infoCarLabel.textColor = UIColor.black
        infoCarLabel.font =  UIFont.systemFont(ofSize: 17)
        
        locationCarLabel.textColor = UIColor.darkGray
        locationCarLabel.font =  UIFont.systemFont(ofSize: 15)
    }
}


extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = photos[indexPath.item]
        
        let targetSize = CGSize(width: collectionView.frame.width / 1 - 15, height: collectionView.frame.width / 2 - 15)
        
        let scaledSize = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: CGPoint.zero, size: targetSize)).size
        
        return CGSize(width: ceil(scaledSize.width), height: ceil(scaledSize.height))
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    
}
