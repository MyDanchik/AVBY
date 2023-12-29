import UIKit

class ButtonTableViewCell: UITableViewCell {
    weak var delegate: ButtonTableViewCellDelegate?
    
    @IBOutlet weak var appealButton: UIButton!
    @IBAction func appealButton(_ sender: UIButton) {
        delegate?.didTapAppealButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    // MARK: - Привытные методы
    private func setupUI() {
        selectionStyle = .none
        appealButton.layer.cornerRadius = 8
        appealButton.setTitle("Пожаловаться", for: .normal)
        appealButton.tintColor = .white
        appealButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
}
protocol ButtonTableViewCellDelegate: AnyObject {
    func didTapAppealButton()
}
