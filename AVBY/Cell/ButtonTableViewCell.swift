import UIKit

class ButtonTableViewCell: UITableViewCell {
    weak var presentingViewController: UIViewController?
    
    @IBOutlet weak var appealButton: UIButton!
    @IBAction func appealButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Данная функция в разработке", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in print("ok")}))
                presentingViewController?.present(alert, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        appealButton.layer.cornerRadius = 8
        appealButton.setTitle("Пожаловаться", for: .normal)
        appealButton.tintColor = .white
        appealButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }

    
}
