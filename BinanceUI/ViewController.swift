//
//  ViewController.swift
//  BinanceUI
//
//  Created by Mehmet Ali Demir on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    var data = ["BNB", "BTC", "ETH", "APT", "BAT"]
    var firstPrice = ["304,6", "22.977,60", "1.605,14", "18.1814", "0.492"]
    var secondPrice = ["304,35", "22.973,77", "1.604,62", "18.17", "0.492"]
    var ratioNumber = ["+%1,30", "+%1,76", "+%1,86", "+%1,47", "+%1,70"]


    @IBOutlet weak var coinTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        coinTableView.delegate = self
        coinTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinTableViewCell

        cell.coinLabel.text = data[indexPath.row]
        cell.firstPrice.text = firstPrice[indexPath.row]
        cell.secondPrice.text = secondPrice[indexPath.row]

        cell.ratioNumberLabel.titleLabel?.text = ratioNumber[indexPath.row]
        cell.fireImage.image = data[indexPath.row].hashValue < 5 ? UIImage(named: "fire") : nil



        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }


}

