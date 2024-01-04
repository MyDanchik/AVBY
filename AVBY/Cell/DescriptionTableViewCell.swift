import UIKit

final class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!

    @IBOutlet private var optionsStackView: UIStackView!

    @IBOutlet private var optionsLabel: UILabel!
    
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
