import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var conteinerView: UIView!
        
    @IBOutlet weak var nameCarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        conteinerView.layer.cornerRadius = 10
    }

    
}
