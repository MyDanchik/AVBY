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
    
    @IBOutlet weak var topvinCarView: UIView!
    
    @IBOutlet weak var topCarView: UIView!
    
    @IBOutlet weak var vinCarView: UIView!
    
    @IBOutlet weak var leasingButton: UIButton!
    
    @IBOutlet weak var leaseСalculationButton: UIButton!
    
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var vinImage: UIImageView!
    
    @IBOutlet weak var vinLabel: UILabel!
    
    
    private var photos = [UIImage]()
    func configure(photos: [UIImage]) {
        self.photos = photos
        self.photoCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conteinerView.layer.cornerRadius = 10
        lineView.backgroundColor = UIColor.systemGray2
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
        selectionStyle = .none
        
        textEdit()
        topvinEdit()
        leasingEdit()
        
        if let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 3
            layout.minimumLineSpacing = 0
        }
    }
    
    func configure(carTop: Bool, winCar: Bool) {
        updateViewVisibility(carTop: carTop, winCar: winCar)
        
    }
    
    private func updateViewVisibility(carTop: Bool, winCar: Bool) {
        topCarView.isHidden = !carTop
        vinCarView.isHidden = !winCar
        topvinCarView.isHidden = !(carTop || winCar)
    }
    
    private func textEdit() {
        nameCarLabel.textColor = UIColor.black
        nameCarLabel.font =  UIFont.systemFont(ofSize: 18)
        
        priceCarLabel.textColor = UIColor.black
        priceCarLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        dpriceCarLabel.textColor = UIColor.darkGray
        dpriceCarLabel.font =  UIFont.systemFont(ofSize: 17)
        
        infoCarLabel.textColor = UIColor.black
        infoCarLabel.font =  UIFont.systemFont(ofSize: 14)
        
        locationCarLabel.textColor = UIColor.darkGray
        locationCarLabel.font =  UIFont.systemFont(ofSize: 12)
    }
    
    private func topvinEdit() {
        
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        
        topCarView.backgroundColor = .yellow
        vinCarView.backgroundColor = .systemGreen
        
        topImage.image = UIImage(systemName: "star.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vinImage.image = UIImage(systemName: "checkmark", withConfiguration: boldConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        topLabel.text = "ТОП"
        vinLabel.text = "VIN"
        
        topLabel.font =  UIFont.boldSystemFont(ofSize: 10)
        vinLabel.font =  UIFont.boldSystemFont(ofSize: 10)
        
        topLabel.textColor = UIColor.black
        vinLabel.textColor = UIColor.white
        
    }
    
    private func leasingEdit() {
        
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        leaseСalculationButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        leasingButton.setTitleColor(UIColor.systemBlue, for: .normal)
        leaseСalculationButton.setTitleColor(UIColor.systemBlue, for: .normal)
    }
}


extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            
            if indexPath.item == 0 {
                iconCell.setCornerRadiusFirst(5)
            } else if indexPath.item == photos.count - 1 {
                iconCell.setCornerRadiusLast(5)
            } else {
                iconCell.setCornerRadiusFirst(0)
                iconCell.setCornerRadiusLast(0)
            }
            
            return iconCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = photos[indexPath.item]
        
        let targetSize = CGSize(width: collectionView.frame.width / 1 - 15, height: collectionView.frame.width / 1 - 140)
        
        let scaledSize = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: CGPoint.zero, size: targetSize)).size
        
        return CGSize(width: ceil(scaledSize.width), height: ceil(scaledSize.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    
}
