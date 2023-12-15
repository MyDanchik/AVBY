import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        iconImageView.image = image
    }
    func setCornerRadiusFirst(_ cornerRadius: CGFloat) {
        iconImageView.layer.cornerRadius = cornerRadius
        iconImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func setCornerRadiusLast(_ cornerRadius: CGFloat) {
        iconImageView.layer.cornerRadius = cornerRadius
        iconImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
}
