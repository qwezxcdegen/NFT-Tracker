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
    var walletAddr = ""
    var walletBal = 0.0 {
        didSet {
            wallets.insert(Result(walletAddress: walletAddr, sol_balance: walletBal, num_nfts: walletNFTs), at: 0)
            tableView.reloadData()
        }
    }
    var walletNFTs = 0
    
//    let networkManager = NetworkTrackerManager()
    
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

        cell.walletAddressLabel.text = wallets[indexPath.row].walletAddress
        cell.amountOfNFTLabel.text = String(describing: wallets[indexPath.row].num_nfts)
        cell.amountOfSolLabel.text = String(describing: wallets[indexPath.row].sol_balance)
        
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
        presentAddAlertController(title: "Wallet address", message: nil, style: .alert) { address in
            self.fetchWalletData(address)
            self.tableView.reloadData()
            print(self.wallets)
        }
        self.tableView.reloadData()
        print(self.wallets)
    }
    
}
