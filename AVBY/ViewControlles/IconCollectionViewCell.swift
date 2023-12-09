import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        iconImageView.image = image
        iconImageView.layer.cornerRadius = 10
    }
}
