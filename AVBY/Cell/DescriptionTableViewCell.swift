import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var optionsStackView: UIStackView!

    @IBOutlet weak var optionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func set(title: String, options: [String]) {
        titleLabel.text = title
        optionsLabel.text = options.joined(separator: "")
    }
    
    func configureUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        optionsLabel.font = UIFont.systemFont(ofSize: 15)
        optionsLabel.textColor = .subtitle
    }
}
