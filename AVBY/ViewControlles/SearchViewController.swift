import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paramButton: UIButton!
    @IBOutlet weak var searchParamButton: UIButton!
    @IBOutlet weak var buttonParamView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupButtonParamView()
    }
    // MARK: - Настройка таблицы
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundVC
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
    }
    // MARK: - Настройка навигационной панели
    
    func setupNavigationBar() {
        navigationItem.title = "\(nameCar.count) объявлений"
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .tabBar
    }
    // MARK: - Настройка кнопки
    
    func setupButton(_ button: UIButton, imageName: String, title: String) {
        let sfImage = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.setImage(sfImage, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.backgroundColor = .bottomButton
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    // MARK: - Настройка кнопок параметров
    
    func setupButtonParamView() {
        setupButton(paramButton, imageName: "slider.horizontal.3", title: "  Параметры")
        setupButton(searchParamButton, imageName: "sparkle.magnifyingglass", title: "")
        buttonParamView.backgroundColor = .clear
    }
    // MARK: - Появление и скрытие кнопок
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let hideButtonOffset: CGFloat = 50
        let animationDuration: TimeInterval = 0.3
        
        if offset < hideButtonOffset && buttonParamView.alpha == 0 {
            buttonParamView.isHidden = false
            
            UIView.animate(
                withDuration: animationDuration,
                animations: {
                    self.buttonParamView.alpha = 1.0
                }
            )
        } else if offset >= hideButtonOffset && buttonParamView.alpha != 0 {
            UIView.animate(
                withDuration: animationDuration,
                animations: {
                    self.buttonParamView.alpha = 0.0
                },
                completion: { _ in
                    self.buttonParamView.isHidden = true
                }
            )
        }
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let namesCar = nameCar[indexPath.row]
        let imagesCar = imageCar[indexPath.row]
        let pricesCar = priceCar[indexPath.row]
        let dpricesCar = Double(pricesCar)! / 3.2
        let formatPrice = String(format: "%.0f" + " $", dpricesCar)
        let locationsCar = locationCar[indexPath.row]
        let carTop = topCar[indexPath.row]
        let carWin = vinCar[indexPath.row]
        let leasing = Double(pricesCar)! / 60//лизинг на 5 лет
        let formatLeasing = String(format: "%.0f", leasing)
        let datesCar = dateCar[indexPath.row]
        let yearsCar = yearCar[indexPath.row]
        let gearboxsCar = gearboxCar[indexPath.row]
        let scopesCar = scopeCar[indexPath.row]
        let engineTypesCar = engineTypeCar[indexPath.row]
        let mileagesCar = mileageCar[indexPath.row]
        let bodyTypesCar = bodyTypeCar[indexPath.row]
        let drivesCar = driveCar[indexPath.row]
        let colorsCar = colorCar[indexPath.row]
        let pricesCarText = "\(pricesCar) р."
        let attributedPricesText = createAttributedText(for: pricesCarText, highlightingSubstring: "р.", withBoldSystemFont: 15)
        let leasingText = "от \(formatLeasing) BYN/месяц"
        let attributedLeasingText = createAttributedText(for: leasingText, highlightingSubstring: "\(formatLeasing) BYN", withBoldSystemFont: 13)
        let infoText = infoCar[indexPath.row]
        let equipmentText = equipmentCar[indexPath.row]
        let arrayEquipment = equipmentText.joined(separator: ",\n")
        let exchangeText = exchangeCar[indexPath.row]
    
        
        cell.priceCarLabel.attributedText = attributedPricesText
        cell.leaseСalculationButton.setAttributedTitle(attributedLeasingText, for: .normal)
        cell.leasingButton.setTitle("Лизинг", for: .normal)
        cell.nameCarLabel.text = namesCar
        cell.configure(photos: imagesCar)
        cell.dpriceCarLabel.text = "≈ \(formatPrice)"
        cell.infoCarLabel.text = "\(yearsCar), \(gearboxsCar), \(scopesCar), \(engineTypesCar), \(mileagesCar), \(bodyTypesCar), \(drivesCar), \(colorsCar)"
        cell.locationCarLabel.text = "\(locationsCar) · \(datesCar)"
        cell.configure(carTop: carTop, winCar: carWin)
        cell.infoLongLabel.text = infoText
        cell.equipmentLabel.text = arrayEquipment
        cell.exchangeLabel.text = exchangeText
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCar.count
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

extension SearchViewController: XIBTableViewCellDelegate {
    func receivedData(name: String, price: String, dprice: String, infoMin: String, location: String, image: [UIImage], infoLong: String, equipment: [String], exchange: String, leasing: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.receivedNameText = "\(name)"
        vc.receivedPriceText = "\(price)"
        vc.receivedDPriceText = "\(dprice)"
        vc.receivedInfoText = "\(infoMin)"
        vc.receivedLocationText = "\(location)"
        vc.receivedImages = image
        vc.receivedInfoLong = "\(infoLong)"
        vc.receivedEquipmentText  = equipment
        vc.receivedExchangeText = exchange
        vc.receivedLeasingText = leasing
    }
    
    
}
