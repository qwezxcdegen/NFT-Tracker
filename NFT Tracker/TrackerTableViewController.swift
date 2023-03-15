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
        cell.amountOfSolLabel.text = String(describing: wallets[indexPath.row].amountOfSol!)
        cell.amountOfNFTLabel.text = String(describing: wallets[indexPath.row].amountOfNFT!)
        cell.NFTWorthLabel.text = String(describing: wallets[indexPath.row].worthOfNFT!)
        
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
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        presentAddAlertController(title: "qwe", message: "qwe", style: .alert) { name in
            self.wallets.insert(Wallet(walletAddress: name, amountOfSol: 12, amountOfNFT: 12, worthOfNFT: 12), at: 0)
            self.tableView.reloadData()
        }
    }
    
}
