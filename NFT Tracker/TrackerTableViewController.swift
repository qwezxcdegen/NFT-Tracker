//
//  TrackerTableViewController.swift
//  NFT Tracker
//
//  Created by Степан Фоминцев on 12.03.2023.
//

import UIKit

class TrackerTableViewController: UITableViewController {
    
    var wallets: [Result] = [
//        Result(num_tokens: 1, sol_balance: 2, num_nfts: 3)
    ]
    
    let networkManager = NetworkTrackerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        networkManager.fetchFromWallet()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wallets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath) as! TrackerTableViewCell
        
//        cell.walletAddressLabel.text = wallets[indexPath.row].walletAddress
//        cell.amountOfSolLabel.text = String(describing: wallets[indexPath.row].amountOfSol!)
//        cell.amountOfNFTLabel.text = String(describing: wallets[indexPath.row].amountOfNFT!)
//        cell.NFTWorthLabel.text = String(describing: wallets[indexPath.row].worthOfNFT!)
        
        cell.walletAddressLabel.text = "qwe"
        cell.amountOfNFTLabel.text = String(describing: wallets[indexPath.row].sol_balance)
        cell.amountOfNFTLabel.text = "qwe"
        cell.NFTWorthLabel.text = "qwe"
        
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.backgroundColor = UIColor(hex: 0x65A5D1)
        
        cell.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        116
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        presentAddAlertController(title: "qwe", message: "qwe", style: .alert) { name in
            DispatchQueue.main.async {
                print(name)
                let walletBal = self.fetchFromWallet(name)
                self.wallets.insert(Result(num_tokens: 0, sol_balance: walletBal, num_nfts: 0), at: 0)
//                self.wallets.insert(Wallet(walletAddress: name, amountOfSol: 12, amountOfNFT: 12, worthOfNFT: 12), at: 0)
                self.tableView.reloadData()
            }
        }
    }
    
    
    
}

extension TrackerTableViewController {
    func fetchFromWallet(_ wallet: String) -> Double {
        var walletBalance = 0.0
        var request = URLRequest(url: URL(string: "https://api.shyft.to/sol/v1/wallet/get_portfolio?network=mainnet-beta&wallet=\(wallet)")!,timeoutInterval: Double.infinity)
        request.addValue("-3iYNcRok7Gm4EMl", forHTTPHeaderField: "x-api-key")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)

            do {
                let walletData = try JSONDecoder().decode(Wallet.self, from: data)
                walletBalance = walletData.result.sol_balance
                self.wallets.insert(Result(num_tokens: 0, sol_balance: walletBalance, num_nfts: 0), at: 0)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
        return walletBalance
    }
}
