import UIKit
import AVFoundation

protocol XIBTableViewCellDelegate {
    func receivedData(name: String, price: String, dprice: String, infoMin: String, location: String, image: [UIImage], infoLong: String, equipment: [String], exchange: String, leasing: String)
}
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
    @IBOutlet weak var photoView: UIView!
    
    @IBOutlet weak var infoLongLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    
    @IBAction func leasingButtonNext(_ sender: UIButton) {
        tapToNext()
        
    }
    
    
    

    // MARK: - Свойства
    var delegate: XIBTableViewCellDelegate?
    private var photos = [UIImage]()
    
    // MARK: - Публичные методы
    
    func configure(photos: [UIImage]) {
        self.photos = photos
        self.photoCollectionView.reloadData()
    }
    
    func configure(carTop: Bool, winCar: Bool) {
        updateViewVisibility(carTop: carTop, winCar: winCar)
    }
    
    // MARK: - Жизненный цикл
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Приватные методы
    
    private func configureUI() {
        configureContainerView()
        configureCollectionView()
        selectionStyle = .none
        textEdit()
        topvinEdit()
        leasingEdit()
        configureCollectionViewLayout()
    }
    
    private func configureContainerView() {
        conteinerView.layer.cornerRadius = 10
        conteinerView.backgroundColor = .backgroundCell
        lineView.backgroundColor = UIColor.separate
    }
    
    private func configureCollectionView() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.backgroundColor = .backgroundCell
        photoCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
    }
    
    private func configureCollectionViewLayout() {
        if let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 3
            layout.minimumLineSpacing = 0
        }
    }
    
    private func updateViewVisibility(carTop: Bool, winCar: Bool) {
        topCarView.isHidden = !carTop
        vinCarView.isHidden = !winCar
        topvinCarView.isHidden = !(carTop || winCar)
    }
    //настройки текста в лейблах
    private func textEdit() {
        nameCarLabel.textColor = UIColor.title
        nameCarLabel.font =  UIFont.systemFont(ofSize: 18)
        
        priceCarLabel.textColor = UIColor.title
        priceCarLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        dpriceCarLabel.textColor = UIColor.subtitle
        dpriceCarLabel.font =  UIFont.systemFont(ofSize: 15)
        
        infoCarLabel.textColor = UIColor.title
        infoCarLabel.font =  UIFont.systemFont(ofSize: 14)
        
        locationCarLabel.textColor = UIColor.subtitle
        locationCarLabel.font =  UIFont.systemFont(ofSize: 12)
    }
    //топ и вин
    private func topvinEdit() {
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        
        topCarView.backgroundColor = .top
        vinCarView.backgroundColor = .vin
        
        topCarView.layer.cornerRadius = 2.5
        vinCarView.layer.cornerRadius = 2.5
        
        topImage.image = UIImage(systemName: "star.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vinImage.image = UIImage(systemName: "checkmark", withConfiguration: boldConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        topLabel.text = "ТОП"
        vinLabel.text = "VIN"
        
        topLabel.font =  UIFont.boldSystemFont(ofSize: 10)
        vinLabel.font =  UIFont.boldSystemFont(ofSize: 10)
        
        topLabel.textColor = UIColor.black
        vinLabel.textColor = UIColor.white
    }
    //кнопки лизинга
    private func leasingEdit() {
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        leaseСalculationButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        leasingButton.setTitleColor(UIColor.buttonText, for: .normal)
        leaseСalculationButton.setTitleColor(UIColor.buttonText, for: .normal)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            //закругление первого и последнего фото
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
    //обрезка фото под размер
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = photos[indexPath.item]
        
        let widthMultiplier: CGFloat = 2
        let heightMultiplier: CGFloat = 1
        
        let targetWidth = collectionView.frame.width * widthMultiplier
        let targetHeight = targetWidth * heightMultiplier
        
        let maxHeight: CGFloat = 250
        let adjustedHeight = min(targetHeight, maxHeight)
        
        let targetSize = CGSize(width: targetWidth, height: adjustedHeight)
        
        let scaledSize = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: CGPoint.zero, size: targetSize)).size
        
        return CGSize(width: scaledSize.width.rounded(), height: scaledSize.height.rounded())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapToNext()
    }
    
    private func tapToNext() {
        delegate?.receivedData(
            name: nameCarLabel.text ?? "",
            price: priceCarLabel.text ?? "",
            dprice: dpriceCarLabel.text ?? "",
            infoMin: infoCarLabel.text ?? "",
            location: locationCarLabel.text ?? "",
            image: photos,
            infoLong: infoLongLabel.text ?? "",
            equipment: equipmentLabel.text?.components(separatedBy: "") ?? [],
            exchange: exchangeLabel.text ?? "",
            leasing: leaseСalculationButton.titleLabel?.text ?? ""
        )
        print("dadad")
    }
}
