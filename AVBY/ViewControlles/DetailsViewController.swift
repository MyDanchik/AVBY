import UIKit

enum CarViewSection {
    case options(CarOptions)
}
struct CarOptions {
    let title: String
    let options: [String]
}
final class DetailsViewController: UIViewController, ButtonTableViewCellDelegate, DetailsTableViewCellDelegate {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    // MARK: - IBActions
    @IBAction func callButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    @IBAction func messageButton(_ sender: UIButton) {
        alertButtonConfiguration()
    }
    var receivedCarDetails: Car?
    
    private var sections = [CarViewSection]()
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonParamView()
        setupTableView()
        setupNavigationBar()
        makeData()
    }
    // MARK: - Настройка таблицы
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
    // MARK: - Настройка навигационной панели
    private func setupNavigationBar() {
        navigationItem.title = receivedCarDetails?.name
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
    // MARK: - Конфигурация предупреждения
    func alertButtonConfiguration() {
        let alert = UIAlertController(title: "Данная функция в разработке", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        }))
        
        present(alert, animated: true)
    }
    // MARK: - Создание данных для отображения
    private func makeData() {
        let detailsSection: CarViewSection = .options(CarOptions(title: "Объявление", options: [""]))
        let infoSection: CarViewSection = .options(CarOptions(title: "Описание", options: ["\(receivedCarDetails?.infoLong ?? "Нет информации")"]))
        let equipmentOptions: CarViewSection = .options(CarOptions(title: "Комплектация", options: receivedCarDetails?.equipment ?? []))
        let exhangeSection: CarViewSection = .options(CarOptions(title: "Обмен не интересует", options: ["\(receivedCarDetails?.exchange ?? "Нет информации")"]))
        let buttonSection: CarViewSection = .options(CarOptions(title: "Кнопка", options: [""]))
        
        sections.append(contentsOf: [detailsSection, infoSection, equipmentOptions, exhangeSection, buttonSection])
    }
    //Функции кнопок
    func didTapShareButton() {
        alertButtonConfiguration()
    }
    
    func didTapCommentButton() {
        alertButtonConfiguration()
    }
    
    func didTapFavouritesButton() {
        alertButtonConfiguration()
    }
    
    func didTapBelvebButton() {
        alertButtonConfiguration()
    }
    
    func didTapViewsButton() {
        alertButtonConfiguration()
    }
}
// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func didTapAppealButton() {
        alertButtonConfiguration()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .options(_):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
        case let .options(carOptions):
            if carOptions.title == "Объявление" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
                let namesCar = receivedCarDetails?.name
                let pricesCar = receivedCarDetails?.price
                let infosCar = receivedCarDetails?.infoMin
                let locationsCar = receivedCarDetails?.location
                let detail = receivedCarDetails?.image ?? []
                let dpricesCar = receivedCarDetails?.dprice
                let leasingCar = receivedCarDetails?.leasing
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
                cell.delegate = self
                tableView.backgroundColor = .systemGray6
                
                return cell
            }  else if carOptions.title == "Кнопка" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
                cell.delegate = self // Устанавливаем делегата
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
                cell.set(title: carOptions.title, options: carOptions.options)
                return cell
            }
        }
        // MARK: - Вспомогательные функции
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
