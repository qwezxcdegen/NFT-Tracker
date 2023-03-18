//
//  WalletModel.swift
//  NFT Tracker
//
//  Created by Степан Фоминцев on 12.03.2023.
//

import Foundation

struct Wallet: Decodable {
    let success: Bool
    let message: String
    let result: Result
}

struct Result: Decodable {
    let num_tokens: Int
    let sol_balance: Double
    let num_nfts: Int
}
