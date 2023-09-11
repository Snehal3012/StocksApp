//
//  Stocks.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
