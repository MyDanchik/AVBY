import UIKit

class DetailsViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var receivedNameText: String?
    var receivedPriceText: String?
    var receivedDPriceText: String?
    var receivedInfoText: String?
    var receivedLocationText: String?
    var receivedDescriptionText: String?
    var receivedEquipmentText: String?
    var receivedExchangeTaxt: String?
    var receivedImages: [UIImage]?
    var receivedIndex: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()

    }
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundVC
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
    }
    func setupNavigationBar() {
        navigationItem.title = "\(nameCar.count) объявлений"
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .tabBar
    }
    


}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        let namesCar = receivedNameText
        let pricesCar = receivedPriceText
        let infosCar = receivedInfoText
        let locationsCar = receivedLocationText
        let detail = receivedImages ?? []
        let dpricesCar = receivedDPriceText


        let pricesCarText = pricesCar ?? "default value"
        let attributedPricesText = createAttributedText(for: pricesCarText, highlightingSubstring: "р.", withBoldSystemFont: 15)


        cell.priceCarLabel.attributedText = attributedPricesText
        cell.nameCarLabel.text = namesCar
        cell.infoCarLabel.text = infosCar
        cell.locationCarLabel.text = locationsCar

        cell.configure(photos: detail)
        cell.dpriceCarLabel.text = (dpricesCar)
        
        tableView.backgroundColor = .systemGray6
        
        return cell
    }
    
    func createAttributedText(for text: String, highlightingSubstring substring: String, withBoldSystemFont fontSize: CGFloat) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        
        if let range = text.range(of: substring) {
            let nsRange = NSRange(range, in: text)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: fontSize), range: nsRange)
        }
        
        return attributedText
    }
    
}
