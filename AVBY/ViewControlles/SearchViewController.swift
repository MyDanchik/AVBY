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
        
        cell.nameCarLabel.text = namesCar
        cell.configure(photos: detail)
        cell.priceCarLabel.text = "\(pricesCar) р."
        cell.dpriceCarLabel.text = "≈ \(formatPrice)"
        cell.infoCarLabel.text = infosCar
        cell.locationCarLabel.text = locationsCar
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCar.count
    }
    
    
}
