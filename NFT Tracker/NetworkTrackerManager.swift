//
//  NetworkTrackerManager.swift
//  NFT Tracker
//
//  Created by Степан Фоминцев on 17.03.2023.
//

import Foundation

struct NetworkTrackerManager {
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
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
        return walletBalance
    }
}
