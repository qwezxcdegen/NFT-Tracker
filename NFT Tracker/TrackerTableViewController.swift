//
//  TrackerTableViewController.swift
//  NFT Tracker
//
//  Created by Степан Фоминцев on 12.03.2023.
//

import UIKit

class TrackerTableViewController: UITableViewController {
    
    var wallets: [Wallet] = [
        Wallet(walletAddress: "qweee", amountOfSol: 12, amountOfNFT: 5, worthOfNFT: 500)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.navigationItem.leftBarButtonItem = self.editButtonItem
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
        cell.layer.cornerRadius = 15
        cell.backgroundColor = UIColor(hex: 0x8C6DD7)
        
        return cell
    }
}
