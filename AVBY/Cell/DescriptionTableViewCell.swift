import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var optionsStackView: UIStackView!

    @IBOutlet weak var optionsLabel: UILabel!
    
    func set(title: String, options: [String]) {
        titleLabel.text = title
        optionsLabel.text = options.joined(separator: ", ")
    }
}
