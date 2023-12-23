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
    
    @IBOutlet weak var callButton: UIButton!

    @IBOutlet weak var messageButton: UIButton!
    @IBAction func callButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    
    @IBAction func messageButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    var receivedNameText: String?
    var receivedPriceText: String?
    var receivedDPriceText: String?
    var receivedInfoText: String?
    var receivedLocationText: String?
    var receivedDescriptionText: String?
    var receivedImages: [UIImage]?
    var receivedIndex: String?
    var receivedInfoLong: String?
    var receivedEquipmentText: [String]?
    var receivedExchangeText: String?
    var receivedLeasingText: String?
    
    private var sections = [CarViewSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonParamView()
        setupTableView()
        setupNavigationBar()
        makeData()

        
    }
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
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
    // MARK: - Настройка кнопки
    
    func setupButton(_ button: UIButton, imageName: String, title: String) {
        let sfImage = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .medium))
        button.setImage(sfImage, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.backgroundColor = .vin
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    // MARK: - Настройка кнопок параметров
    
    func setupButtonParamView() {
        setupButton(callButton, imageName: "", title: "Позвонить...")
        setupButton(messageButton, imageName: "ellipsis.bubble.fill", title: "")
    }
    
    func alertButtonConfiguration() {
        let alert = UIAlertController(title: "Данная функция в разработке", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        }))
        
        present(alert, animated: true)
    }
    
    
    
    
    private func makeData() {
        let detailsSection: CarViewSection = .options(CarOptions(title: "Объявление", options: [""]))
        let infoSection: CarViewSection = .options(CarOptions(title: "Описание", options: ["\(receivedInfoLong ?? "Нет информации")"]))
        let equipmentOptions: CarViewSection = .options(CarOptions(title: "Комплектация", options: receivedEquipmentText ?? []))
        let exhangeSection: CarViewSection = .options(CarOptions(title: "Обмен не интересует", options: ["\(receivedExchangeText ?? "Нет информации")"]))
        let buttonSection: CarViewSection = .options(CarOptions(title: "Кнопка", options: [""]))
        
        sections.append(contentsOf: [detailsSection, infoSection, equipmentOptions, exhangeSection, buttonSection])
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
                let leasingCar = receivedLeasingText
                let pricesCarText = pricesCar ?? "default value"
                let attributedPricesText = createAttributedText(for: pricesCarText, highlightingSubstring: "р.", withBoldSystemFont: 15)
                let leasingText = leasingCar ?? "default value"
                let attributedLeasingText = createAttributedText(for: leasingText, highlightingSubstring: "", withBoldSystemFont: 13)
                
                cell.priceCarLabel.attributedText = attributedPricesText
                cell.nameCarLabel.text = namesCar
                cell.infoCarLabel.text = infosCar
                cell.locationCarLabel.text = locationsCar
                cell.configure(photos: detail)
                cell.dpriceCarLabel.text = (dpricesCar)
                cell.leaseСalculationButton.setAttributedTitle(attributedLeasingText, for: .normal)
                cell.presentingDetalisViewController = self
                tableView.backgroundColor = .systemGray6
                
                return cell
            }  else if carOptions.title == "Кнопка" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
                cell.presentingViewController = self
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
