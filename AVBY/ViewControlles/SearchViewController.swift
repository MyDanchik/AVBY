import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        
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
