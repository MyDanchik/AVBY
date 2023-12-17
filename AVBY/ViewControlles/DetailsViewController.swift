import UIKit

enum CarViewSection {
    case options(CarOptions)
}

struct CarOptions {
    let title: String
    let options: [String]
}
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
    
    private var sections = [CarViewSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        makeData() 
        tableView.reloadData()
        
    }
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundVC
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
    }
    private func setupNavigationBar() {
        navigationItem.title = receivedNameText
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .tabBar
    }
    private func makeData() {
        
        let detailsSection: CarViewSection = .options(CarOptions(title: "Объявление", options: [""]))
        let infoSection: CarViewSection = .options(CarOptions(title: "Описание", options: ["Очень интересно"]))
        let optionsSection: CarViewSection = .options(CarOptions(title: "Комплектация", options: ["ABS", "LED", "Turbo"]))
        let exhangeSection: CarViewSection = .options(CarOptions(title: "Обмен не интересует", options: ["Продавца не интересует обменПродавца не интересует обменПродавца не интересует обменПродавца не интересует обменПродавца не интересует обменПродавца не интересует обмен"]))
        let buttonSection: CarViewSection = .options(CarOptions(title: "Кнопка", options: ["Кликни меня"]))
        
        sections.append(contentsOf: [detailsSection,infoSection, optionsSection, exhangeSection, buttonSection])
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .options(let carOptions):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
        case let .options(carOptions):
            if carOptions.title == "Объявление" {
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
            }  else if carOptions.title == "Кнопка" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
                // Configure your ButtonTableViewCell here
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
                cell.set(title: carOptions.title, options: carOptions.options)
                return cell
            }
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
}
