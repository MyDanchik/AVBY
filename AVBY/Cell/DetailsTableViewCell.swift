import UIKit
import AVFoundation

class DetailsTableViewCell: UITableViewCell {
    weak var presentingDetalisViewController: UIViewController?
    
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
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var separatorSecondView: UIView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var vinImage: UIImageView!
    @IBOutlet weak var vinLabel: UILabel!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var viewsButton: UIButton!
    @IBOutlet weak var viewsTextButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var favouritesButton: UIButton!
    
    @IBOutlet weak var belvebButton: UIButton!
    
    
    @IBAction func shareButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    @IBAction func commentButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    @IBAction func favouritesButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    @IBAction func belvebButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    @IBAction func viewsButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    // MARK: - Свойства
    
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
        setupButtonParamView()

        viewsButton.layer.cornerRadius = 8
        viewsButton.backgroundColor = .buttonText
        viewsButton.alpha = 0.05
        viewsTextButton.tintColor = .buttonText
        
        viewsTextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        
    }
    
    private func configureContainerView() {
        conteinerView.layer.cornerRadius = 0
        conteinerView.backgroundColor = .backgroundCell
        separatorView.backgroundColor = .separate
        separatorSecondView.backgroundColor = .separate
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
        infoCarLabel.font =  UIFont.systemFont(ofSize: 16)
        
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
        leasingButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        leaseСalculationButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        leasingButton.setTitleColor(UIColor.buttonText, for: .normal)
        leaseСalculationButton.setTitleColor(UIColor.buttonText, for: .normal)
        
        belvebButton.layer.cornerRadius = 8
        belvebButton.backgroundColor = .buttonText
        belvebButton.alpha = 0.05
    }
    func setupButton(_ button: UIButton, imageName: String, title: String) {
        let sfImage = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .medium))
        button.setImage(sfImage, for: .normal)
        button.tintColor = .buttonText
        button.backgroundColor = .clear
        button.setTitleColor(.buttonText, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    func alertButtonConfiguration() {
        let alert = UIAlertController(title: "Данная функция в разработке", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in print("ok")}))
                presentingDetalisViewController?.present(alert, animated: true)
        
    }

    // MARK: - Настройка кнопок параметров

    func setupButtonParamView() {
        setupButton(shareButton, imageName: "square.and.arrow.up", title: "Поделиться")
        setupButton(commentButton, imageName: "plus.message", title: "Комментарий")
        setupButton(favouritesButton, imageName: "bookmark", title: "В избранное")
    }
}



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension DetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    

}
