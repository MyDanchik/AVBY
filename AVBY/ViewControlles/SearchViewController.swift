import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var paramButton: UIButton!
    
    @IBOutlet weak var searchParamButton: UIButton!
    
    @IBOutlet weak var buttonParamView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundVC
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        
        navigationItem.title = "\(nameCar.count) объявлений"
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .tabBar
        
        buttonParamView.backgroundColor = .clear
        paramButtonEdit()
    }
    
    func paramButtonEdit() {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        
        let sfSlider = UIImage(systemName: "slider.horizontal.3", withConfiguration: symbolConfiguration)
        paramButton.setImage(sfSlider, for: .normal)
        paramButton.tintColor = UIColor.white
        paramButton.layer.cornerRadius = 8
        paramButton.backgroundColor = UIColor.bottomButton
        paramButton.setTitleColor(UIColor.white, for: .normal)
        paramButton.setTitle("  Параметры", for: .normal)
        paramButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let sfGlass = UIImage(systemName: "sparkle.magnifyingglass", withConfiguration: symbolConfiguration)
        searchParamButton.setImage(sfGlass, for: .normal)
        searchParamButton.tintColor = UIColor.white
        searchParamButton.layer.cornerRadius = 8
        searchParamButton.backgroundColor = UIColor.bottomButton
        searchParamButton.setTitleColor(UIColor.white, for: .normal)
        searchParamButton.setTitle("", for: .normal)
    }
    
    //появление и скрытие кнопок
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let namesCar = nameCar[indexPath.row]
        let detail = imageCar[indexPath.row]
        let pricesCar = priceCar[indexPath.row]
        let dpricesCar = Double(pricesCar)! / 3.2
        let formatPrice = String(format: "%.0f" + " $", dpricesCar)
        let infosCar = infoCar[indexPath.row]
        let locationsCar = locationCar[indexPath.row]
        let carTop = topCar[indexPath.row]
        let carWin = vinCar[indexPath.row]
        let leasing = (Double(pricesCar)! / 3.2) / 60 //лизинг на 5 лет
        let formatLeasing = String(format: "%.0f", leasing)
        
        cell.leaseСalculationButton.setTitle("от \(formatLeasing) USD/месяц", for: .normal)
        cell.leasingButton.setTitle("Лизинг", for: .normal)
        cell.nameCarLabel.text = namesCar
        cell.configure(photos: detail)
        cell.priceCarLabel.text = "\(pricesCar) р."
        cell.dpriceCarLabel.text = "≈ \(formatPrice)"
        cell.infoCarLabel.text = infosCar
        cell.locationCarLabel.text = locationsCar
        cell.configure(carTop: carTop, winCar: carWin)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCar.count
    }
    
    
}
