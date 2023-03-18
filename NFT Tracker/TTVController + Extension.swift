//
//  TTVController + Extension.swift
//  NFT Tracker
//
//  Created by Степан Фоминцев on 18.03.2023.
//

import Foundation

extension TrackerTableViewController {
    func fetchWalletData(_ wallet: String) {
        let url = URL(string: "https://api.shyft.to/sol/v1/wallet/get_portfolio?network=mainnet-beta&wallet=\(wallet)")!
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("-3iYNcRok7Gm4EMl", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            
            let walletData = try? JSONDecoder().decode(Wallet.self, from: data)
            guard let walletData else { return }
            DispatchQueue.main.async {
                self.walletAddr = wallet
                self.walletBal = walletData.result.sol_balance
                self.walletNFTs = walletData.result.num_nfts
                print(wallet)
                print(walletData.result.sol_balance)
                print(walletData.result.num_nfts)
            }
        }.resume()
    }
}
