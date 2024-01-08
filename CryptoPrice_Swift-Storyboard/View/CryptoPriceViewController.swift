//
//  ViewController.swift
//  CryptoPrice_Swift-Storyboard
//
//  Created by Alexander on 3.01.24.
//

import UIKit

final class CryptoPriceViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Private properties
    private var cryptocurrencies: [Cryptocurrency] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configUI()
        loadData()
    }

    // MARK: - Helpers
    private func configUI() {
        activityIndicatorView.startAnimating()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "XibCryptoPriceTableViewCell", bundle: nil), forCellReuseIdentifier: "XibCryptoPriceTableViewCell")
    }
    
    private func loadData() {
        NetworkManager.instance.getCryptoPrice() { result in
            switch result {
            case .success(let res):
                self.cryptocurrencies = res
                self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.isHidden = true
                self.tableView.reloadData()
            case .failure(let failure):
                self.showErrorAlert(error: failure.localizedDescription)
            }
        }
    }
    
    private func showErrorAlert(error: String) {
        let alertController = UIAlertController(title: "Ошибка!", message: error, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - TableViewDelegate/DataSource
extension CryptoPriceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrencies.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel(frame: CGRect(x: 15, y: 28, width: tableView.frame.width - 20, height: 40))
        label.text = "Exhange Rates"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 36, weight: .bold)
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "XibCryptoPriceTableViewCell", for: indexPath) as? XibCryptoPriceTableViewCell {
            let cryptocurrency = cryptocurrencies[indexPath.row]
            cell.setInformation(cryptocurrency: cryptocurrency)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
